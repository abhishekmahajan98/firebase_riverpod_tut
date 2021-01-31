import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseriverpodtut/services/auth_services.dart';
import 'package:flutter_riverpod/all.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authServicesProvider = Provider<AuthenticationService>((ref) {
  return AuthenticationService(ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<User>((ref) {
  return ref.watch(authServicesProvider).authStateChange;
});
