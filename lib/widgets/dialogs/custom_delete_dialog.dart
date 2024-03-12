import 'package:flutter/cupertino.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';

class CustomDeleteDialog extends StatelessWidget {
  const CustomDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Are You Sure You Want To Leave?',
        style: AppTextStyles.dialogTitle,
      ),
      content: Text(
        'This action will finish the timer, do you want to leave?',
        style: AppTextStyles.dialogContent,
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            'Cancel',
            style: AppTextStyles.dialogTitle.copyWith(
              color: AppTheme.systemBlue,
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            'Delete',
            style: AppTextStyles.dialogTitle.copyWith(
              color: AppTheme.systemRed,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
