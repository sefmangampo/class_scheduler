import 'package:flutter/material.dart';
import 'package:san_na_ko/database/crud/crud_imports.dart';

class CreateCourseWidget extends StatefulWidget {
  final Course? course;
  final ValueChanged<String> onSubmit;

  const CreateCourseWidget({
    Key? key,
    this.course,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<CreateCourseWidget> createState() => _CreateCourseWidgetState();
}

class _CreateCourseWidgetState extends State<CreateCourseWidget> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.course != null;
    return AlertDialog(
      title: Text(isEditing ? 'Edit course' : 'Add Course'),
      content: Form(
        key: formKey,
        child: TextFormField(
          autofocus: true,
          controller: controller,
          decoration: InputDecoration(hintText: 'Name'),
          validator: (value) =>
              value != null && value.isEmpty ? 'Name is required' : null,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text('Cancel')),
        TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                widget.onSubmit(controller.text);
              }
            },
            child: Text('Ok')),
      ],
    );
  }
}
