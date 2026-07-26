// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rick_and_morty/features/Character%20Details/presentation/screen/widgets/character_state.dart';

// class CharacterImage extends StatelessWidget {
//   const CharacterImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: .none,
//       children: [
//         Container(
//           height: 350.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20.r),
//             image: const DecorationImage(
//               image: NetworkImage(
//                 "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
//               ),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Positioned(top: 300.h, left: 12.h, child: const CharacterState()),
//       ],
//     );
//   }
// }
