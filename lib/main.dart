import 'package:explore_reo/providers/data_provider.dart';
import 'package:explore_reo/providers/theme_provider.dart';
import 'package:explore_reo/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeChanger()..initialize(),
        ),
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: ScreenUtilInit(
          minTextAdapt: true,
          designSize: const Size(392, 781),
          builder: (context, index) {
            return Consumer<ThemeChanger>(
                builder: (context, themeChanger, child) {
              return MaterialApp(
                builder: (context, widget) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                    child: widget!,
                  );
                },
                debugShowCheckedModeBanner: false,
                //theme: Themes.light,
                themeMode: themeChanger.themeMode,
                home: const MainScreen(),
              );
            });
          }),
    );
  }
}
