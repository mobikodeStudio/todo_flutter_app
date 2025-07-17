import 'package:get_it/get_it.dart';
import 'package:todo_flutter_app/presentation/signup/bloc/signup_bloc.dart';

import '../presentation/login/bloc/login_bloc.dart';
import '../presentation/splash/splash_bloc.dart';

final getIt = GetIt.instance;

void serviceInjector() {
  getIt.registerFactory(() => SignupBloc());
  getIt.registerFactory(() => SplashBloc());
  getIt.registerFactory(() => LoginBloc());
}
