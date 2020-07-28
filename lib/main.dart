import 'package:cottoncandy/repos/langRepo.dart';
import 'package:cottoncandy/screens/splashScreen.dart';
import 'package:cottoncandy/utils/lacals/appTransilationDelgate.dart';
import 'package:cottoncandy/utils/lacals/application.dart';
import 'package:cottoncandy/utils/themeColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: colorPrimary));

  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTranslationsDelegate _newLocaleDelegate;

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  @override
  void initState() {
    application.onLocaleChanged = onLocaleChange;
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: Locale('ar', 'sa'));

    LangRepo().getLocaleCode().then((code) {
      setState(() {
        _newLocaleDelegate =
            AppTranslationsDelegate(newLocale: Locale(code, code));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _newLocaleDelegate.newLocale.languageCode == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Candy',
          theme: ThemeData(
            backgroundColor: Colors.white,
            accentColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          localizationsDelegates: [
            _newLocaleDelegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: application.supportedLocales(),
          locale: _newLocaleDelegate.newLocale,
          home: SplashScreen()),
    );
  }
}