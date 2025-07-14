import 'package:get_it/get_it.dart';
import 'package:todo_flutter_app/presentation/signup/bloc/signup_bloc.dart';

final getIt = GetIt.instance;

void serviceInjector() {
  getIt.registerFactory(() => SignupBloc());
}
