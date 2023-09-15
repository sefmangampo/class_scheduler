import 'package:flutter/cupertino.dart';
import 'package:san_na_ko/components/forms/records/course_form.dart';

void showFormDialog(BuildContext context) {
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text('School Year'),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                isDefaultAction: true,
                child: Text('Cancel'),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                isDefaultAction: true,
                child: Text('Save'),
              )
            ],
            content: CupertinoFormSection(
              // header: Text('Record'),
              children: createFormChildren(),
            ),
          ));
}
