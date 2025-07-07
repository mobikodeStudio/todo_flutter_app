import 'package:get_it/get_it.dart';
import 'package:todo_flutter_app/presentation/login/bloc/login_bloc.dart';

import '../presentation/splash/splash_bloc.dart';
// import 'package:todo_flutter_app/presentation/login/bloc/signin_bloc.dart'; // create this

final getIt = GetIt.instance;

void serviceInjector() {
  getIt.registerLazySingleton(() => LoginBloc());
  getIt.registerLazySingleton(() => SplashBloc());
  // getIt.registerLazySingleton(() => SigninBloc()); // create this
}
