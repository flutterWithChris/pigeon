import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigeon/app/inbox/bloc/inbox_bloc.dart';
import 'package:pigeon/app/inbox/repo/inbox_repository.dart';
import 'package:pigeon/core/presentation/theme.dart';
import 'package:pigeon/core/router/router.dart';
import 'package:pigeon/reply/bloc/reply_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => InboxRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ReplyBloc(),
          ),
          BlocProvider(
            create: (context) => InboxBloc(
              inboxRepository: context.read<InboxRepository>(),
            )..add(LoadInbox()),
          ),
        ],
        child: MaterialApp.router(
          // showSemanticsDebugger: true,
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          debugShowCheckedModeBanner: false,
          title: 'Pigeon',
          theme: ThemeData(
              //canvasColor: Colors.transparent,
              colorScheme: flexSchemeLight,
              fontFamily: GoogleFonts.laila().fontFamily),
          darkTheme: ThemeData(
              //  canvasColor: Colors.transparent,
              colorScheme: flexSchemeDark,
              fontFamily: GoogleFonts.laila().fontFamily),
          themeMode: ThemeMode.system,
        ),
      ),
    );
  }
}
