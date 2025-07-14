abstract class SignupState {}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccess extends SignupState {}
class SignupValid extends SignupState {
  final bool isValid;
  SignupValid(this.isValid);
}

class SignupError extends SignupState {
  final String error;

  SignupError(this.error);


}
