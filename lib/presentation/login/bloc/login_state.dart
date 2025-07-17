abstract class LoginState {
  final bool isBtnEnabled;

  const LoginState({required this.isBtnEnabled});
}

class LoginInitial extends LoginState {
  const LoginInitial() : super(isBtnEnabled: false);
}
class LoginEmailErrorState extends LoginState {

  const LoginEmailErrorState() : super(isBtnEnabled: false);
}

class OnSignInOnLoadState extends LoginState {

  const OnSignInOnLoadState({required super.isBtnEnabled});
}

class OnSignInBtnClickState extends LoginState {
  const OnSignInBtnClickState() : super(isBtnEnabled: false);

}
class OnSignUpOnClickState extends LoginState{
  const OnSignUpOnClickState () : super(isBtnEnabled: false);

}
