
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isButtonEnabled =false;
  String? confirmPasswordError;
  String?emailError;
  @override
  void initState() {
    super.initState();
    nameController.addListener(validateFields);
    emailController.addListener(validateFields);
    mobileController.addListener(validateFields);
    passwordController.addListener(validateFields);
    confirmPasswordController.addListener(validateFields);
  }

  void validateFields() {
    setState(() {
      isButtonEnabled = nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          mobileController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;
      if (confirmPasswordController.text.isNotEmpty &&
          passwordController.text != confirmPasswordController.text) {
        confirmPasswordError = "Passwords do not match";
        isButtonEnabled = false;
      } else {
        confirmPasswordError = null;
      }
    });
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                 const Text(
                     "TodoApp",
                 style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                const Text(
                    "Create your account",
                  style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Full Name",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                  const SizedBox(height: 6),
                TextField(
                  controller: nameController,
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
                const SizedBox(height: 6),
                TextField(
                  controller: emailController,
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
                const SizedBox(height: 6),
                 TextField(
                  controller: mobileController,
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
                const SizedBox(height: 6),
                TextField(
                  controller: passwordController,
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
                   controller: confirmPasswordController,
                  obscureText: hideConfirmPassword,
                  decoration: InputDecoration(
                    hintText: "Confirm your Password",
                    border: OutlineInputBorder(),
                    errorText: confirmPasswordError,
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
                    onPressed: isButtonEnabled
                        ? () {
                      // Put your signup logic here
                      print("Signing Up...");
                    }
                        : null, // disables the button if fields are empty
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
