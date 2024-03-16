import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vulcanic_pomodoro_focus_timer/providers/providers.dart';
import 'package:vulcanic_pomodoro_focus_timer/screens/screens.dart';
import 'package:vulcanic_pomodoro_focus_timer/services/services.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    NotificationService().init();

    final preferences = await SharedPreferences.getInstance();

    final sqlService = SqlService();
    await sqlService.init();

    runApp(ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MyApp(
          sqlService: sqlService,
          sharedPreferences: preferences,
        );
      },
    ));
  }, (error, stack) {
    debugPrint(error.toString());
    debugPrintStack(stackTrace: stack);
  });
}

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool opaque = true,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    opaque: opaque,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.sqlService,
    required this.sharedPreferences,
  });

  final SqlService sqlService;
  final SharedPreferences sharedPreferences;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _router = GoRouter(
      initialLocation: '/splash',
      routes: [
        GoRoute(
          path: '/splash',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const SplashScreen(),
            );
          },
        ),
        GoRoute(
          path: '/welcome',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const WelcomeScreen(),
            );
          },
        ),
        GoRoute(
          path: '/premium',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: PremiumScreen(onClose: () => context.go('/')),
            );
          },
        ),
        ShellRoute(
          pageBuilder: (context, state, child) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: NavigationScreen(
                path: state.fullPath ?? '/',
                child: child,
              ),
            );
          },
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const TimersScreen(),
                );
              },
              routes: [
                GoRoute(
                  path: 'timer',
                  pageBuilder: (context, state) {
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: const TimerScreen(),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/statistics',
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const StatisticsScreen(),
                );
              },
            ),
            GoRoute(
              path: '/shop',
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const ShopScreen(),
                );
              },
            ),
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const SettingsScreen(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => TimersService(widget.sqlService.database),
        ),
        Provider(
          create: (context) => StatisticsService(widget.sqlService.database),
        ),
        Provider(
          create: (context) => PreferencesService(widget.sharedPreferences),
        ),
        ChangeNotifierProvider(
          create: (context) => TimersProvider(
            preferencesService: Provider.of(context, listen: false),
            service: Provider.of(context, listen: false),
            router: _router,
          )..init(),
        ),
        ChangeNotifierProvider(
          create: (context) => StatisticsProvider(
            statisticsService: Provider.of(context, listen: false),
          )..init(),
        ),
        ChangeNotifierProvider(
          create: (context) => StoreProvider(
            preferencesService: Provider.of(context, listen: false),
          )..init(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}
