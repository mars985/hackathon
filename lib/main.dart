import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'package:hackathon/Themes/Demo.dart';
import 'package:hackathon/firebase_options.dart';
import 'package:hackathon/models/product_service.dart';
import 'package:hackathon/pages/intro_page.dart';

import 'package:hackathon/app_state.dart';
import 'package:hackathon/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: (context, child) => MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final ProductService _productService = ProductService();

  final List<Widget> _pages = [
    HomePage(),
  ];
  var _pageSelected = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Hackathon",
      theme: demo,
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return SignInScreen(
              actions: [
                ForgotPasswordAction(((context, email) {
                  final uri = Uri(
                    path: '/sign-in/forgot-password',
                    queryParameters: <String, String?>{
                      'email': email,
                    },
                  );
                  context.push(uri.toString());
                })),
                AuthStateChangeAction(((context, state) {
                  final user = switch (state) {
                    SignedIn state => state.user,
                    UserCreated state => state.credential.user,
                    _ => null
                  };
                  if (user == null) {
                    return;
                  }
                  if (state is UserCreated) {
                    user.updateDisplayName(user.email!.split('@')[0]);
                  }
                  if (!user.emailVerified) {
                    user.sendEmailVerification();
                    const snackBar = SnackBar(
                        content: Text(
                            'Please check your email to verify your email address'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  context.pushReplacement('/');
                })),
              ],
            );
          },
          routes: [
            GoRoute(
              path: 'forgot-password',
              builder: (context, state) {
                final arguments = state.uri.queryParameters;
                return ForgotPasswordScreen(
                  email: arguments['email'],
                  headerMaxExtent: 200,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) {
            return ProfileScreen(
              providers: const [],
              actions: [
                SignedOutAction((context) {
                  context.pushReplacement('/');
                }),
              ],
            );
          },
        ),
      ],
    ),
  ],
);
