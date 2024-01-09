// import 'package:caracal_words/main.dart';
// import 'package:caracal_words/widget/login/login_widget.dart';
// import 'package:caracal_words/widget/word_source_exam/word_exam_unit_widget.dart';
// import 'package:flutter/material.dart';

// class WordExamUnit extends StatelessWidget {
//   const WordExamUnit({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             const Expanded(
//               flex: 6,
//               child: Text(
//                 'Word Exam',
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: GestureDetector(
//                 child: const Icon(Icons.exit_to_app),
//                 onTap: () {
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return const LoginWidget();
//                       },
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//       body: const WordExamUnitWidget(),
//     );
//   }
// }
