import 'package:equatable/equatable.dart';

abstract class LoginState  extends Equatable{
  final bool isBtnEnabled;
  @override
  List<Object?> get props =>[isBtnEnabled];
  const LoginState({required this.isBtnEnabled});
}

class LoginInitial extends LoginState {
  const LoginInitial() : super(isBtnEnabled: false);

  @override
  List<Object?> get props =>[];
}
class LoginEmailErrorState extends LoginState {

  const LoginEmailErrorState() : super(isBtnEnabled: false);

  @override

  List<Object?> get props => [];
}

class OnSignInOnLoadState extends LoginState {

  const OnSignInOnLoadState({required super.isBtnEnabled});

  @override

  List<Object?> get props => [];
}

class OnSignInBtnClickState extends LoginState {
  const OnSignInBtnClickState() : super(isBtnEnabled: false);

  @override

  List<Object?> get props => [];

}
class OnSignUpOnClickState extends LoginState{
  const OnSignUpOnClickState () : super(isBtnEnabled: false);

  @override

  List<Object?> get props => [];

}
