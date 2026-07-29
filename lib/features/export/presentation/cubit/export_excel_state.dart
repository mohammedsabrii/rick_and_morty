import 'package:flutter/foundation.dart';

@immutable
abstract class ExportExcelState {}

class ExportExcelInitial extends ExportExcelState {}

class ExportExcelLoading extends ExportExcelState {}

class ExportExcelSuccess extends ExportExcelState {
  final String filePath;
  ExportExcelSuccess(this.filePath);
}

class ExportExcelFailure extends ExportExcelState {
  final String message;
  ExportExcelFailure(this.message);
}
