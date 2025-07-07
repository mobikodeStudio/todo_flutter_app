import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                 const Text(
                     "TodoApp",
                 style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
                const SizedBox(height: 7),
                const Text(
                    "Create your account",
                  style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Full Name",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                  const SizedBox(height: 7),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your full name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Email Address",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your email address",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Mobile Number",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Enter  mobile number",
                    border: OutlineInputBorder(),
                    prefixText: "+91",
                  ),
                ),
                const SizedBox(height: 20),const Text(
                  "Password",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    hintText: "Create Password",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: (){
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),

                  ),
                ),
                const SizedBox(height: 20),const Text(
                  " Confirm Password",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                 TextField(
                  obscureText: hideConfirmPassword,
                  decoration: InputDecoration(
                    hintText: "Confirm your Password",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hideConfirmPassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: (){
                        setState(() {
                          hideConfirmPassword=!hideConfirmPassword;
                        });
                      }
                    )
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: (){},
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),
                ),
                 const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Text.rich(
                        TextSpan(
                          text: "Already have an account",
                          style: TextStyle(color: Colors.grey),
                          children: [
                            TextSpan(
                              text: "Log in",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                  ),
                ),

                ),
              ],
            ),
          )),


    );
  }
}
