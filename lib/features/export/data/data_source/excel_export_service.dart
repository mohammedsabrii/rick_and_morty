import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';

class ExcelExportService {
  Future<File> exportCharactersToExcel(List<CharacterEntity> characters) async {
    final excel = Excel.createExcel();
    const sheetName = 'Characters';

    excel.rename('Sheet1', sheetName);
    final sheet = excel[sheetName];

    final headers = [
      'ID',
      'Name',
      'Status',
      'Species',
      'Gender',
      'Origin',
      'Location',
      'Episodes Count',
    ];

    final headerStyle = CellStyle(
      bold: true,
      backgroundColorHex: ExcelColor.fromHexString('#3525CD'),
      fontColorHex: ExcelColor.fromHexString('#FFFFFF'),
      horizontalAlign: HorizontalAlign.Center,
      verticalAlign: VerticalAlign.Center,
    );

    for (var colIdx = 0; colIdx < headers.length; colIdx++) {
      final cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: colIdx, rowIndex: 0),
      );
      cell.value = TextCellValue(headers[colIdx]);
      cell.cellStyle = headerStyle;
    }
    sheet.setRowHeight(0, 32.0);

    final dataStyle = CellStyle(
      horizontalAlign: HorizontalAlign.Center,
      verticalAlign: VerticalAlign.Center,
    );

    for (var rowIdx = 0; rowIdx < characters.length; rowIdx++) {
      final character = characters[rowIdx];
      final rowData = [
        character.id?.toString() ?? '',
        character.characterName,
        character.characterState,
        character.species ?? 'unknown',
        character.characterGender,
        character.characterOrigin,
        character.characterLocation,
        character.episodesCount?.toString() ?? '0',
      ];

      final rowIndex = rowIdx + 1;
      sheet.setRowHeight(rowIndex, 26.0);

      for (var colIdx = 0; colIdx < rowData.length; colIdx++) {
        final cell = sheet.cell(
          CellIndex.indexByColumnRow(columnIndex: colIdx, rowIndex: rowIndex),
        );
        cell.value = TextCellValue(rowData[colIdx]);
        cell.cellStyle = dataStyle;
      }
    }

    sheet.setColumnWidth(0, 12.0);
    sheet.setColumnWidth(1, 24.0);
    sheet.setColumnWidth(2, 16.0);
    sheet.setColumnWidth(3, 16.0);
    sheet.setColumnWidth(4, 16.0);
    sheet.setColumnWidth(5, 24.0);
    sheet.setColumnWidth(6, 24.0);
    sheet.setColumnWidth(7, 18.0);

    final fileBytes = excel.save();
    if (fileBytes == null) {
      throw Exception('Failed to generate Excel file bytes.');
    }

    Directory directory;
    if (Platform.isAndroid) {
      final downloads = Directory('/storage/emulated/0/Download');
      if (await downloads.exists()) {
        directory = downloads;
      } else {
        directory =
            (await getExternalStorageDirectory()) ??
            await getApplicationDocumentsDirectory();
      }
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final filePath =
        '${directory.path}/rick_and_morty_characters_$timestamp.xlsx';
    final file = File(filePath);
    await file.writeAsBytes(fileBytes, flush: true);

    return file;
  }
}
