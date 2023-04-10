import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigeon/core/presentation/theme.dart';
import 'package:pigeon/core/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: 'Pigeon',
      theme: ThemeData(
          colorScheme: flexSchemeLight,
          fontFamily: GoogleFonts.laila().fontFamily),
      darkTheme: ThemeData(
          colorScheme: flexSchemeDark,
          fontFamily: GoogleFonts.laila().fontFamily),
      themeMode: ThemeMode.system,
    );
  }
}
