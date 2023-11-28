import 'package:flutter/material.dart';
import 'package:palak/home_screen.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
           "LOGIN PAGE",
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
              thickness: 2,),

           ListTile(
              leading: const Icon(
              Icons.person_pin_rounded,
              color: Colors.white,
              ),
                title: SizedBox(
                 width: 250,
                  child:TextField(
                    style: const TextStyle(color: Colors.grey),
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: "user name",
                      hintStyle: TextStyle(color: Colors.grey),
                       border: InputBorder.none,
              ),
            ),
                ),
           ),
            Divider(
              color: Colors.white70,
              thickness: 2,), // Add a divider between username and password
            ListTile(
              leading: const Icon(
                Icons.password,
                color: Colors.white,
              ),
              title: SizedBox(
                width: 250,
                child:TextField(
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
              thickness: 2,),

            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
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

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Simple validation
    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter both username and password.';
      });
      return;
    }

    // Add more complex validation logic if needed

    // If validation passes, show a welcome message
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
                Navigator.push(context, MaterialPageRoute(builder: (c)=>HomeScreen()));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
        );

  }
}
