import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vulcanic_pomodoro_focus_timer/providers/providers.dart';
import 'package:vulcanic_pomodoro_focus_timer/screens/premium_screen.dart';
import 'package:vulcanic_pomodoro_focus_timer/utils/utils.dart';
import 'package:vulcanic_pomodoro_focus_timer/widgets/widgets.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            SizedBox(height: 18.h),
            const CustomAppBar(text: 'Shop'),
            SizedBox(height: 15.h),
            Expanded(
              child: ListView.builder(
                itemCount: volcanoes.length,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 28.h,
                ),
                itemBuilder: (context, index) {
                  final volcano = volcanoes[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: VolcanoCard(
                      selected: value.volcano.id == volcano.id,
                      premium: value.premium,
                      volcano: volcano,
                      onTap: () {
                        if (!value.premium && volcano.premium) {
                          onTapPremium(context);
                          return;
                        }
                        value.onSelectVolcano(volcano);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void onTapPremium(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => PremiumScreen(),
    );

    Navigator.of(context, rootNavigator: true).push(route);
  }
}
