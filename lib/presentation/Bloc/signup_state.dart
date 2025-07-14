abstract class SignupState {
  final bool hidePassword;
  final bool hideConfirmPassword;
  final String? confirmPasswordError;
  final bool isButtonEnabled;

  SignupState({
    required this.hidePassword,
    required this.hideConfirmPassword,
    required this.confirmPasswordError,
    required this.isButtonEnabled,
  });
}

class SignupInitial extends SignupState {
  SignupInitial()
      : super(
    hidePassword: true,
    hideConfirmPassword: true,
    confirmPasswordError: null,
    isButtonEnabled: false,
  );
}

class SignupSuccess extends SignupState {
  SignupSuccess()
      : super(
    hidePassword: true,
    hideConfirmPassword: true,
    confirmPasswordError: null,
    isButtonEnabled: false,
  );
}
