import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vulcanic_pomodoro_focus_timer/providers/providers.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/paywall.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.8)),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Container(
                    width: 343.w,
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: Image.asset(
                        'assets/png/icons/close.png',
                        width: 40.w,
                        height: 40.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 39.h),
                  SizedBox(
                    width: 175.w,
                    height: 250.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 0,
                          child: Image.asset(
                            'assets/png/image1.png',
                            width: 130.w,
                            height: 130.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Image.asset(
                            'assets/png/timer.png',
                            width: 175.w,
                            height: 175.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 26.h),
                  Text('Premium Skin', style: AppTextStyles.textStyle5),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 12.r,
                        height: 12.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppTheme.gradient1,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'All premium skins',
                        style: AppTextStyles.textStyle6,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 12.r,
                        height: 12.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppTheme.gradient1,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Opportunity to support us',
                        style: AppTextStyles.textStyle6,
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton1(
                    text: 'Get Premium for \$0.99',
                    onTap: () => onBuyPremium(context),
                  ),
                  SizedBox(height: 8.h),
                  CustomButton2(
                    text: 'No Thanks',
                    onTap: Navigator.of(context).pop,
                  ),
                  SizedBox(height: 29.h),
                  Opacity(
                    opacity: 0.7,
                    child: SizedBox(
                      width: 343.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 114.w,
                            height: 55.h,
                            alignment: Alignment.center,
                            child: Text(
                              'Terms of Use',
                              style: AppTextStyles.textStyle3,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => onBuyPremium(context),
                            child: Container(
                              width: 114.w,
                              height: 55.h,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text(
                                'Restore',
                                style: AppTextStyles.textStyle3,
                              ),
                            ),
                          ),
                          Container(
                            width: 114.w,
                            height: 55.h,
                            alignment: Alignment.center,
                            child: Text(
                              'Privacy Policy',
                              style: AppTextStyles.textStyle3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onBuyPremium(BuildContext context) {
    final provider = Provider.of<StoreProvider>(
      context,
      listen: false,
    );
    provider.onBuyPremium();
    Navigator.of(context).pop();
  }
}
