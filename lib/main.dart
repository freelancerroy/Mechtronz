import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:mechtronz/color_palette_gallery.dart';
import 'package:mechtronz/screens/splash/splash_screen.dart';
import 'package:mechtronz/utils/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    DevicePreview(
      enabled: false,
      // enabled: !!kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411, 891),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            title: 'Mechtronz',
            theme: ThemeClass.lightTheme,
            darkTheme: ThemeClass.lightTheme,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: widget ?? Container(),
              );
            },
            home: const SplashScreen(),
            // home: const ColorPaletteGallery(),
          );
        });
  }
}
