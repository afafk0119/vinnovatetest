import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vinnovatetest/data/service/auth.dart';
import 'package:vinnovatetest/screen/productlisting.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState.initial());

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      await Auth().login(email: email, password: password);
      state = const AuthState.authenticated();
      Fluttertoast.showToast(
        msg: "Login successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Productlisting()),
      );
    } on FirebaseAuthException catch (e) {
      state = AuthState.error(e.message ?? "An error occurred during login");
      Fluttertoast.showToast(
        msg: "An error occurred during login please check the credentials",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      state = const AuthState.error("An error occurred during login");
      Fluttertoast.showToast(
        msg: "An error occurred during login",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}

class AuthState {
  const AuthState.initial()
      : isAuthenticated = false,
        errorMessage = null;
  const AuthState.authenticated()
      : isAuthenticated = true,
        errorMessage = null;
  const AuthState.error(this.errorMessage) : isAuthenticated = false;

  final bool isAuthenticated;
  final String? errorMessage;
}
