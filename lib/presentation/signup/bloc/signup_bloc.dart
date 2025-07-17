import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitialState()) {
    on<SignupSubmitted>((event, emit) async {
      if (event.name.isEmpty ||
          event.email.isEmpty ||
          event.mobile.isEmpty ||
          event.password.isEmpty ||
          event.confirmPassword.isEmpty) {
        emit(SignupError("All fields are required."));
        return;
      }

      if (event.password != event.confirmPassword) {
        emit(SignupError("Passwords do not match."));
        return;
      }

      emit(SignupLoadingState());


      await Future.delayed(const Duration(seconds: 2));

      // TODO: Replace with actual signup logic
      emit(SignupSuccess());
    });
  }
}
