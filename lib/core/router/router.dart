import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pigeon/app/home/models/email.dart';
import 'package:pigeon/app/home/view/home.dart';
import 'package:pigeon/app/home/view/view_email.dart';

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
  ],
);
