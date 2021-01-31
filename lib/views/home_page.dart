import 'package:firebaseriverpodtut/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _auth = watch(authServicesProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Home Page',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          RaisedButton(
            onPressed: () => _auth.signout(),
            child: Text('Sign-out'),
          ),
        ],
      ),
    );
  }
}
