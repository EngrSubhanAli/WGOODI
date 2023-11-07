import 'package:flutter/material.dart';

import '../../../theameConstants.dart';

InputDecoration textFieldDecoration({BuildContext? context, String? label, String? hint,Icon? icon}) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: Theme.of(context!).textTheme.bodySmall!.copyWith(color: backgroundColor),
    hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: backgroundColor),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white), // Set the disabled border color
      borderRadius: BorderRadius.circular(15),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white), // Set the enabled border color
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white), // Set the focused border color
      borderRadius: BorderRadius.circular(15),
    ),
    suffixIcon: icon,
      suffixIconColor: Colors.white,
  );
}
