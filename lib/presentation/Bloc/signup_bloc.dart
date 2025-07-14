import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupInitialEvent>((event, emit) {
      emit(SignupInitial());
    });

    on<SignupTextChanged>((event, emit) {
      final isValid = _validateForm(event);

      emit(state.copyWith(
        isButtonEnabled: isValid,
        confirmPasswordError: event.password == event.confirmPassword
            ? null
            : 'Passwords do not match',
      ));
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(hidePassword: !state.hidePassword));
    });

    on<ToggleConfirmPasswordVisibility>((event, emit) {
      emit(state.copyWith(hideConfirmPassword: !state.hideConfirmPassword));
    });

    on<SignupSubmitted>((event, emit) async {
      final isValid = _validateForm(event);

      if (isValid) {
        emit(SignupSuccess()); // Trigger navigation on success
      } else {
        emit(state.copyWith(
          confirmPasswordError: "Please check all fields",
        ));
      }
    });
  }

  bool _validateForm(SignupTextChanged event) {
    return event.name.isNotEmpty &&
        event.email.isNotEmpty &&
        event.mobile.isNotEmpty &&
        event.password.isNotEmpty &&
        event.confirmPassword.isNotEmpty &&
        event.password == event.confirmPassword;
  }

  bool _validateFormFromSubmit(SignupSubmitted event) {
    return event.name.isNotEmpty &&
        event.email.isNotEmpty &&
        event.mobile.isNotEmpty &&
        event.password.isNotEmpty &&
        event.confirmPassword.isNotEmpty &&
        event.password == event.confirmPassword;
  }
}

