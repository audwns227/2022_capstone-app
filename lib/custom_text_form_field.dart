import 'package:flutter/material.dart';
import '/size.dart';

CustomTextFormField({
  required String label,
  required FormFieldSetter onSaved,
  required FormFieldValidator validator,
}) {
  assert(onSaved != null);
  assert(validator != null);

  return Column(
    children: [
      Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      TextFormField(
        onSaved: onSaved,
        validator: validator,
        obscureText: label == "비밀번호" ? true : false,
      ),
      Container(height: 16.0),
    ],
  );
}