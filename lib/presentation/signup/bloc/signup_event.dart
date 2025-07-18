abstract class SignupEvent {}

class SignupSubmitted extends SignupEvent {
  final String name;
  final String email;
  final String mobile;
  final String password;
  final String confirmPassword;

  SignupSubmitted({
    required this.name,
    required this.email,
    required this.mobile,
    required this.password,
    required this.confirmPassword,
  });
}
class SignupTextChanged extends SignupEvent {
  final String name;
  final String email;
  final String mobile;
  final String password;
  final String confirmPassword;

  SignupTextChanged({
    required this.name,
    required this.email,
    required this.mobile,
    required this.password,
    required this.confirmPassword,
  });
}
