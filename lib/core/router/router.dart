import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pigeon/app/compose_email/compose_email.dart';
import 'package:pigeon/app/inbox/view/home.dart';
import 'package:pigeon/app/settings/settings_page.dart';
import 'package:pigeon/app/view_email/view_email.dart';
import 'package:pigeon/core/models/email.dart';

GoRouter router = GoRouter(
  initialLocation: '/',
  observers: [HeroController()],
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        path: '/view-email',
        builder: (context, state) => ViewEmailPage(
              email: state.extra! as Email,
            )),
    GoRoute(
      path: '/compose-email',
      builder: (context, state) => const ComposeEmail(),
    ),
    GoRoute(
        path: '/settings', builder: (context, state) => const SettingsPage()),
  ],
);
