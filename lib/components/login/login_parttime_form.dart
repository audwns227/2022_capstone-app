// // TODO Implement this library.
// import 'package:flutter/material.dart';
// import 'package:flutter_login/custom_text_form_field.dart';
// import 'package:flutter_login/size.dart';
//
// class LoginParttimeForm extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>(); // 1. 글로벌 key
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       // 2. 글로벌 key를 Form 태그에 연결하여 해당 key로 Form의 상태를 관리할 수 있다.
//       key: _formKey,
//       child: Column(
//         children: [
//           CustomTextFormField("핸드폰번호"),
//           SizedBox(height: medium_gap),
//
//           // 3. TextButton 추가
//           TextButton(
//             onPressed: () {
//               // 3. 유효성 검사
//               if (_formKey.currentState!.validate()) {
//                 Navigator.pushNamed(context, "/"); //식당 알바 페이지 만들면 바꾸기
//               }
//             },
//             child: Text("로그인"),
//           ),
//         ],
//       ),
//     );
//   }
// }
