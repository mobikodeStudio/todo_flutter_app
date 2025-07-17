import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/presentation/signup/bloc/signup_bloc.dart';
import 'package:todo_flutter_app/presentation/signup/bloc/signup_event.dart';
import 'package:todo_flutter_app/presentation/signup/bloc/signup_state.dart';
import 'package:todo_flutter_app/presentation/widgets/to_do_text.dart';
import 'package:todo_flutter_app/presentation/widgets/to_do_text_field.dart';
import 'package:todo_flutter_app/presentation/widgets/to_do_primary_button.dart';

import '../../core/injector.dart';
import '../login/bloc/login_bloc.dart';
import '../login/bloc/login_event.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Signup Successful')),
            );
          } else if (state is SignupError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  const Text(
                    "TodoApp",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const ToDoText(
                    label: "Create your account",
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 24),

                  // Full Name
                  ToDoTextField(
                    controller: nameController,
                    textLabel: 'Full Name',
                    textHintLabel: 'Enter your full name',
                    onChanged: _onChanged,
                  ),

                  const SizedBox(height: 12),

                  // Email
                  ToDoTextField(
                    controller: emailController,
                    textLabel: 'Email Address',
                    textHintLabel: 'Enter your email address',
                    onChanged: _onChanged,
                  ),

                  const SizedBox(height: 12),

                  // Mobile
                  ToDoTextField(
                    controller: mobileController,
                    textLabel: 'Mobile Number',
                    textHintLabel: 'Enter mobile number',
                    keyboardType: TextInputType.phone,
                    onChanged: _onChanged,
                  ),

                  const SizedBox(height: 12),

                  // Password
                  ToDoTextField(
                    controller: passwordController,
                    textLabel: 'Password',
                    textHintLabel: 'Create password',
                    obscureText: obscurePassword,
                    isSuffixIconVisible: true,
                    suffixIcon: obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    suffixOnClick: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    onChanged: _onChanged,
                  ),

                  const SizedBox(height: 12),

                  // Confirm Password
                  ToDoTextField(
                    controller: confirmPasswordController,
                    textLabel: 'Confirm Password',
                    textHintLabel: 'Confirm your password',
                    obscureText: obscureConfirmPassword,
                    isSuffixIconVisible: true,
                    suffixIcon: obscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    suffixOnClick: () {
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
                      });
                    },
                    onChanged: _onChanged,
                  ),

                  const SizedBox(height: 24),

                  // Button
                  BlocBuilder<SignupBloc, SignupState>(
                    builder: (context, state) {
                      final isEnabled = state is SignupValid;
                      return ToDoPrimaryButton(
                        label: 'Sign Up',
                        isEnabled: isEnabled,
                        onPressed: () {
                          context.read<SignupBloc>().add(
                            SignupSubmitted(
                              name: nameController.text,
                              email: emailController.text,
                              mobile: mobileController.text,
                              password: passwordController.text,
                              confirmPassword:
                              confirmPasswordController.text,
                            ),
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  // Log in text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => getIt<LoginBloc>()..add(OnSignInOnLoadEvent()),
                                child: const LoginPage (),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onChanged(String value) {
    context.read<SignupBloc>().add(SignupTextChanged(
      name: nameController.text,
      email: emailController.text,
      mobile: mobileController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    ));
  }
}
