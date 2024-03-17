import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vulcanic_pomodoro_focus_timer/models/timer_view.dart';
import 'package:vulcanic_pomodoro_focus_timer/providers/providers.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class CreateTimerSheet extends StatefulWidget {
  const CreateTimerSheet({
    super.key,
    this.isEdit = false,
    required this.timersProvider,
    this.onClose,
  });

  final TimersProvider timersProvider;
  final VoidCallback? onClose;
  final bool isEdit;

  @override
  State<CreateTimerSheet> createState() => _CreateTimerSheetState();
}

class _CreateTimerSheetState extends State<CreateTimerSheet> {
  final nameController = TextEditingController();
  final commentController = TextEditingController();

  final focusNode = FocusNode();

  bool enabled = false;
  int workMinutes = 25;
  int restMinutes = 10;

  late TimerView timerView;

  @override
  void initState() {
    super.initState();
    timerView = widget.timersProvider.timerView;
    if (widget.isEdit) {
      nameController.text = timerView.name;
      commentController.text = timerView.comment;
      workMinutes = timerView.workTime;
      restMinutes = timerView.restTime;
      enabled = timerView.notificationEnabled;
    }
    nameController.addListener(() => setState(() {}));
    focusNode.addListener(() => setState(() {}));
  }

  bool get canSubmit => nameController.text.isNotEmpty;

  bool get keyboardOpen =>
      MediaQuery.of(context).viewInsets.bottom > 0 && focusNode.hasFocus;

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Container(
      width: 375.w,
      height: 714.h + overlay.bottom,
      decoration: BoxDecoration(
        color: AppTheme.bg,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 28.h),
                Text(
                  widget.isEdit ? timerView.name : 'Pomodoro Timer Creation',
                  style: AppTextStyles.textStyle2.copyWith(
                    fontSize: 22.r,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Column(
                      children: [
                        Visibility(
                          visible: !keyboardOpen,
                          child: Column(
                            children: [
                              CustomInput(
                                hintText: 'Name',
                                minLines: 1,
                                maxLength: 24,
                                controller: nameController,
                              ),
                              SizedBox(height: 24.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomTimePicker(
                                    value: workMinutes,
                                    asset: 'assets/png/work.png',
                                    onChanged: (int minutes) {
                                      workMinutes = minutes;
                                      setState(() {});
                                    },
                                  ),
                                  CustomTimePicker(
                                    value: restMinutes,
                                    asset: 'assets/png/rest.png',
                                    onChanged: (int minutes) {
                                      restMinutes = minutes;
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 24.h),
                            ],
                          ),
                        ),
                        CustomInput(
                          hintText: 'Notes (70 symbols max)',
                          minLines: 10,
                          maxLength: 70,
                          focusNode: focusNode,
                          controller: commentController,
                        ),
                        Visibility(
                          visible: !keyboardOpen,
                          child: Column(
                            children: [
                              SizedBox(height: 24.h),
                              SizedBox(
                                width: 343.w,
                                child: Row(
                                  children: [
                                    Text(
                                      'Notification:',
                                      style: AppTextStyles.textStyle2.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.r,
                                      ),
                                    ),
                                    SizedBox(width: 20.w),
                                    CustomSwitch1(
                                      value: enabled,
                                      onChanged: (value) {
                                        setState(() {
                                          enabled = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              CustomButton1(
                                text: widget.isEdit ? 'Save' : 'Create',
                                enabled: canSubmit,
                                textStyle: AppTextStyles.textStyle2.copyWith(
                                  fontSize: 22.r,
                                ),
                                onTap: widget.isEdit ? onSave : onCreate,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 12.w,
            top: 12.h,
            child: GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Container(
                width: 31.w,
                height: 31.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.gray2.withOpacity(0.73),
                ),
                child: Image.asset(
                  'assets/png/icons/close.png',
                  width: 11.w,
                  height: 11.h,
                  color: AppTheme.darkBlue,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onCreate() {
    if (nameController.text.isEmpty) return;
    final timerView = TimerView(
      id: 0,
      name: nameController.text,
      workTime: workMinutes,
      restTime: restMinutes,
      comment: commentController.text,
      notificationEnabled: enabled,
    );
    widget.timersProvider.onCreateTimer(timerView);

    Navigator.of(context).pop(true);
    onClear();
  }

  void onSave() {
    if (nameController.text.isEmpty) return;
    final newTimerView = TimerView(
      id: timerView.id,
      name: nameController.text,
      workTime: workMinutes,
      restTime: restMinutes,
      comment: commentController.text,
      notificationEnabled: enabled,
    );
    widget.timersProvider.onEditTimer(newTimerView);
    widget.onClose?.call();
    Navigator.of(context).pop(true);
    onClear();
  }

  void onClear() {
    workMinutes = 25;
    restMinutes = 10;
    enabled = false;
    nameController.clear();
    commentController.clear();
    setState(() {});
  }
}
