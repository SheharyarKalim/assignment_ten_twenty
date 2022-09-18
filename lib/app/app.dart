import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../src/config/routes/app_routes.dart';
import '../src/config/strings/string_keys.dart';
import '../src/config/themes/app_themes.dart';
import '../src/injector.dart';
import '../src/presentation/screens/dashboard/dashboard.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (context, child) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(), child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringKeys.instance.tenTwenty,
        themeMode: ThemeMode.system,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        getPages: AppRoutes.instance.pages,
        initialBinding: Injector(),
        initialRoute: Dashboard.id,
      )),
    );
  }
}
