import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/core/injector.dart';
import 'package:todo_flutter_app/presentation/login/bloc/login_bloc.dart';
import 'package:todo_flutter_app/presentation/widgets/to_do_primary_button.dart';
import 'package:todo_flutter_app/presentation/widgets/to_do_text.dart';
import 'package:todo_flutter_app/presentation/widgets/to_do_text_field.dart';

import '../home_page/bloc/home_bloc.dart';
import '../home_page/bloc/home_event.dart';
import '../home_page/home_page.dart';
import '../signup/bloc/signup_bloc.dart';
import '../signup/signup_screen.dart';
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
          if (state is OnSignInBtnClickState) {
             Navigator.of(context).push(
              MaterialPageRoute(
                 builder: (context) => BlocProvider(
                create: (context) => getIt<HomeBloc>()..add(HomeInitialEvent(selectedIndex: 0)),
                 child: const HomeScreen(),
             ),
              ),
             );
          }
          if (state is OnSignUpOnClickState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => getIt<SignupBloc>(),
                  child: const SignupScreen(),
                ),
              ),
            );
          }
          if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
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
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 30),
              ToDoTextField(
                controller: emailController,
                textLabel: 'Email',
                textHintLabel: 'Enter your Email',
                isSuffixIconVisible: false,
                onChanged: (value) {
                  context.read<LoginBloc>().add(
                    OnTextChangeEvent(
                      email: value,
                      password: passwordController.text,
                    ),
                  );
                },
              ),
              const SizedBox(height: 3),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginEmailErrorState) {
                    return Text(
                      'Not a valid email',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
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
                onChanged: (value) {
                  context.read<LoginBloc>().add(
                    OnTextChangeEvent(
                      email: emailController.text,
                      password: value,
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: ToDoText(
                  label: 'Forget Password?',
                  color: Colors.blueAccent,
                  textAlign: TextAlign.right,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 24),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is OnSignInOnLoadState ||
                      state is LoginEmailErrorState || state is OnSignInBtnClickState) {
                    return Center(
                      child: ToDoPrimaryButton(
                        isEnabled: state.isBtnEnabled,
                        label: 'Sign In',
                        onPressed: () {
                          context.read<LoginBloc>().add(
                            OnSignInBtnClickEvent(),
                          );
                        },
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    context.read<LoginBloc>().add(OnSignUpOnClickEvent());
                  },
                  child: RichText(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
