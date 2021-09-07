import '../utils/authentication.dart';
import 'google_sign_in_button.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD84C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: 350, maxHeight: 350),
                      child: Image.asset(
                        'assets/introduction_animation/dustbie.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height:50),
                    Text(
                      "Welcome to\nünidust",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
