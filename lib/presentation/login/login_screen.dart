import 'package:flutter/material.dart';
import 'package:untitled5/presentation/widgets/to_do_primary_button.dart';
import 'package:untitled5/presentation/widgets/to_do_text.dart';
import 'package:untitled5/presentation/widgets/to_do_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Center(child: Image.asset('assets/images/todo.jpg')),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'WELCOME BACK',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: ToDoText(label: 'Sign in to continue', color: Colors.black,),
            ),
            const SizedBox(height: 30),
            ToDoTextField(controller: emailController, textLabel: 'Email', textHintLabel: 'Enter your Email',isSuffixIconVisible: false,),

            const SizedBox(height: 20),
            ToDoTextField(
              controller: passwordController,
              textLabel: 'Password',
              textHintLabel: 'Enter your password',
              isSuffixIconVisible: true,
              obscureText: _obscurePassword,
              suffixIcon:
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              suffixOnClick: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            SizedBox(height: 30),
            ToDoPrimaryButton(label: 'Sign In', onPressed: () {  },isEnabled: true,),

          ],
        ),
      ),
    );
  }
}


