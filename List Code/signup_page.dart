import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Full Name",
              style: TextStyle(fontSize: 20, color: Colors.pink),
            ),

            const SizedBox(height: 10),

            const TextField(
              decoration: InputDecoration(labelText: "Enter Full Name"),
            ),

            const SizedBox(height: 10),

            const Text(
              "Email",
              style: TextStyle(fontSize: 20, color: Colors.pink),
            ),

            const SizedBox(height: 10),

            const TextField(
              decoration: InputDecoration(labelText: "Enter Email"),
            ),

            const SizedBox(height: 10),

            const Text(
              "Password",
              style: TextStyle(fontSize: 20, color: Colors.pink),
            ),

            const SizedBox(height: 10),

            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Enter Password"),
            ),

            const SizedBox(height: 10),

            const Text(
              "Confirm Password",
              style: TextStyle(fontSize: 20, color: Colors.pink),
            ),

            const SizedBox(height: 10),

            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Confirm Password"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text("Sign Up"),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}