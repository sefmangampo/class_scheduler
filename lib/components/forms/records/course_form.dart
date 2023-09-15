import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

createFormChildren() {
  return [
    CupertinoFormRow(
        child: CupertinoTextFormFieldRow(
      prefix: Text(
        'Name:',
        style: TextStyle(color: Colors.orange),
      ),
      placeholder: 'Enter name',
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please etner a value';
        }
        return null;
      },
    )),
    CupertinoFormRow(
        child: CupertinoTextFormFieldRow(
      textAlign: TextAlign.left,
      prefix: Text(
        'Fullname:',
        style: TextStyle(color: Colors.orange),
      ),
      placeholder: 'Enter fullname',
    )),
    CupertinoFormRow(
        prefix: Text(
          'Active',
          style: TextStyle(color: Colors.orange),
        ),
        child: CupertinoSwitch(value: true, onChanged: (bool? value) {})),
  ];
}
