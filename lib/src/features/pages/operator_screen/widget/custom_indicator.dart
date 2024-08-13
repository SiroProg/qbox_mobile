// import 'package:flutter/material.dart';
// import 'package:learn_webrtc/src/core/style/app_colors.dart';
// import 'package:loading_indicator/loading_indicator.dart';

// class CustotomIndicator extends StatelessWidget {
//   const CustotomIndicator({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//       width: 100,
//       height: 45,
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: AppColors.blue,
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(20),
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//         ),
//         child: Center(
//           child: SizedBox(
//             width: 40,
//             height: 20,
//             child: LoadingIndicator(
//               indicatorType: Indicator.ballBeat,
//               colors: [Colors.white],
//               strokeWidth: 0,
//               pathBackgroundColor: Colors.black,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
