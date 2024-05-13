import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _email, _password;

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth.signInWithEmagitilAndPassword(
          email: _email, password: _password);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to sign in. Please check your credentials.'),
      ));
    }
  }

  Future<void> _registerWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to register. Please try again later.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => _email = value.trim(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (value) => _password = value.trim(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _signInWithEmailAndPassword(context),
                child: Text('Sign In'),
              ),
              ElevatedButton(
                onPressed: () => _registerWithEmailAndPassword(context),
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
