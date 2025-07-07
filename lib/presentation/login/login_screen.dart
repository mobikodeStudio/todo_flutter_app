import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/core/injector.dart';
import 'package:todo_flutter_app/presentation/login/bloc/login_bloc.dart';
// import 'package:todo_flutter_app/presentation/login/bloc/signin_bloc.dart';
// import 'package:todo_flutter_app/presentation/login/signin_screen.dart';
import 'package:todo_flutter_app/presentation/widgets/to_do_primary_button.dart';
import 'package:todo_flutter_app/presentation/widgets/to_do_text.dart';
import 'package:todo_flutter_app/presentation/widgets/to_do_text_field.dart';

import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

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
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is OnSigninBtnClickState) {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => BlocProvider(
            //       create: (context) => getIt<SigninBloc>(),
            //       child: const Signin_Screen(),
            //     ),
            //   ),
            // );
          }
        },
        child: Padding(
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
                child: ToDoText(
                  label: 'Sign in to continue',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              ToDoTextField(
                controller: emailController,
                textLabel: 'Email',
                textHintLabel: 'Enter your Email',
                isSuffixIconVisible: false,
              ),
              const SizedBox(height: 20),
              ToDoTextField(
                controller: passwordController,
                textLabel: 'Password',
                textHintLabel: 'Enter your password',
                isSuffixIconVisible: true,
                obscureText: _obscurePassword,
                suffixIcon: _obscurePassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                suffixOnClick: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Center(
                child: ToDoText(
                  label: 'Forget Password?',
                  color: Colors.blue,
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ToDoPrimaryButton(
                  label: 'Sign In',
                  onPressed: () {
                    getIt<LoginBloc>().add(OnSigninBtnClickEvent());
                  },
                ),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(color: Colors.black),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
