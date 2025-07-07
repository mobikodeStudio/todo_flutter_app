import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/presentation/login/bloc/login_bloc.dart';
import 'package:todo_flutter_app/presentation/login/login_screen.dart';
import 'package:todo_flutter_app/presentation/splash/splash_bloc.dart';

import '../../core/injector.dart';
import '../login/bloc/login_event.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
      if (state is SplashOnLoadState) {
         Navigator.of(context).push(
          MaterialPageRoute(
           builder: (context) => BlocProvider(
             create: (context) => getIt<LoginBloc>()..add(OnSignInOnLoadEvent()),
            child: const LoginPage (),
           ),
          ),
        );
      }
    },

   child: Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Centered main content
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Color(0xFF2563EB),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
                      SizedBox(height: 32),
                      Text(
                        'TaskFlow',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Organize your day, achieve more',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom aligned version text
              Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 24), // for some spacing from bottom
            ],
          ),
        ),
      ),
    ),);
  }
}
