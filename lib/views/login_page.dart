import 'package:firebaseriverpodtut/providers/auth_providers.dart';
import 'package:firebaseriverpodtut/providers/login_page_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

class LoginPage extends ConsumerWidget {
  void updateEmail(BuildContext context, String email) {
    context.read(emailProvider).state = email;
  }

  void updatePassword(BuildContext context, String pass) {
    context.read(passwordProvider).state = pass;
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final email = watch(emailProvider).state;
    final pass = watch(passwordProvider).state;
    final _auth = watch(authServicesProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          TextField(
            onChanged: (value) => updateEmail(context, value),
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextField(
            onChanged: (value) => updatePassword(context, value),
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          RaisedButton(
            onPressed: () => _auth.signIn(email: email, password: pass),
            child: Text('Sign-in'),
          ),
        ],
      ),
    );
  }
}
