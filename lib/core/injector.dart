import 'package:get_it/get_it.dart';
import 'package:todo_flutter_app/presentation/calendar/bloc/calendar_bloc.dart';
import 'package:todo_flutter_app/presentation/home_page/bloc/home_bloc.dart';
import 'package:todo_flutter_app/presentation/settings/bloc/settings_bloc.dart';
import 'package:todo_flutter_app/presentation/signup/bloc/signup_bloc.dart';

import '../presentation/add_task_screen/bloc/add_task_screen_bloc.dart';
import '../presentation/login/bloc/login_bloc.dart';

import '../presentation/splash/splash_bloc.dart';

final getIt = GetIt.instance;

void serviceInjector() {
  getIt.registerFactory(() => SignupBloc());
  getIt.registerFactory(() => SplashBloc());
  getIt.registerFactory(() => LoginBloc());
  getIt.registerFactory(() => AddTaskScreenBloc());
  getIt.registerFactory(() => HomeBloc());
  getIt.registerFactory(() => CalendarBloc());
  getIt.registerFactory(() => SettingsBloc());



}
