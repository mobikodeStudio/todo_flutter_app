abstract class LoginEvent {}

class OnSignInInitialEvent extends LoginEvent {}
class OnSignInOnLoadEvent extends LoginEvent {}
class OnSignUpOnClickEvent extends LoginEvent {}


class OnSignInBtnClickEvent extends LoginEvent {}

class OnTextChangeEvent extends LoginEvent {
  final String email;
  final String password;

  OnTextChangeEvent({required this.email, required this.password});
}
class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});
}
