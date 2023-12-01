import 'package:bhavya/home_screen.dart';
import 'package:bhavya/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "SIGN UP PAGE",
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              color: Colors.white70,
              thickness: 2,
            ),
            ListTile(
              leading: const Icon(
                Icons.person_pin_rounded,
                color: Colors.white,
              ),
              title: SizedBox(
                width: 250,
                child: TextField(
                  style: const TextStyle(color: Colors.grey),
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: "email",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.white70,
              thickness: 2,
            ),
            ListTile(
              leading: const Icon(
                Icons.password,
                color: Colors.white,
              ),
              title: SizedBox(
                width: 250,
                child: TextField(
                  style: const TextStyle(color: Colors.grey),
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "password",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.white70,
              thickness: 2,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _navigateToSignUp,
              child: Text('Sign Up'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: _navigateToSignUp,
                  style: ElevatedButton.styleFrom(primary: Colors.black), // Change button color to black
                  child: Text('Login In'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  void _signup() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Simple validation
    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter both email and password.';
      });
      return;
    }
    _showWelcomeDialog(username);
  }

  void _showWelcomeDialog(String username) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Welcome!'),
          content: Text('Welcome, $username!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => HomeScreen()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


  void _navigateToSignUp() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _usernameController.text,
        password: _passwordController.text).then((value) {
      print("Created new account");
      // Navigate to the SignUp page
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()));
    }).onError((error, stackTrace) {
      print("error ${error.toString()}");
    });
  }
}
