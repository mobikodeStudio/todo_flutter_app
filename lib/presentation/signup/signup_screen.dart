import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/presentation/home/home_screen.dart';
import '../Bloc/signup_bloc.dart';
import '../Bloc/signup_event.dart';
import '../Bloc/signup_state.dart';

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

  @override
  void initState() {
    super.initState();
    nameController.addListener(_onChanged);
    emailController.addListener(_onChanged);
    mobileController.addListener(_onChanged);
    passwordController.addListener(_onChanged);
    confirmPasswordController.addListener(_onChanged);
  }

  void _onChanged() {
    context.read<SignupBloc>().add(SignupTextChanged(
      name: nameController.text,
      email: emailController.text,
      mobile: mobileController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    ));
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
    return BlocProvider(
      create: (_) => SignupBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocListener<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state is SignupSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomeScreen(),
                    ),
                  );
                }
              },
              child: BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "TodoApp",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Create your account",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10),

                        const Text("Full Name",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: "Enter your full name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),

                        const Text("Email Address",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Enter your email address",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),

                        const Text("Mobile Number",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        TextField(
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: "Enter mobile number",
                            prefixText: "+91",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),

                        const Text("Password",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        TextField(
                          controller: passwordController,
                          obscureText: state.hidePassword,
                          decoration: InputDecoration(
                            hintText: "Create Password",
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(state.hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                context
                                    .read<SignupBloc>()
                                    .add(TogglePasswordVisibility());
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        const Text("Confirm Password",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        TextField(
                          controller: confirmPasswordController,
                          obscureText: state.hideConfirmPassword,
                          decoration: InputDecoration(
                            hintText: "Confirm your Password",
                            border: const OutlineInputBorder(),
                            errorText: state.confirmPasswordError,
                            suffixIcon: IconButton(
                              icon: Icon(state.hideConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                context.read<SignupBloc>().add(
                                    ToggleConfirmPasswordVisibility());
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onPressed: state.isButtonEnabled
                                ? () {
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
                            }
                                : null,
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text.rich(
                              TextSpan(
                                text: "Already have an account? ",
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
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
