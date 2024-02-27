import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/app_state.dart';
import 'package:hackathon/models/authentication.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (context, appState, _) => AuthFunc(
          loggedIn: appState.loggedIn,
          signOut: () {
            FirebaseAuth.instance.signOut();
          }),
    );
  }
}
