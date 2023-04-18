import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigeon/core/presentation/theme.dart';
import 'package:pigeon/core/router/router.dart';
import 'package:pigeon/reply/bloc/reply_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReplyBloc(),
      child: MaterialApp.router(
        // showSemanticsDebugger: true,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        title: 'Pigeon',
        theme: ThemeData(
            canvasColor: Colors.transparent,
            colorScheme: flexSchemeLight,
            fontFamily: GoogleFonts.laila().fontFamily),
        darkTheme: ThemeData(
            canvasColor: Colors.transparent,
            colorScheme: flexSchemeDark,
            fontFamily: GoogleFonts.laila().fontFamily),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
