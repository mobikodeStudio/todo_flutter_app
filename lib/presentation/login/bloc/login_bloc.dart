import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/regex.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<OnSignInBtnClickEvent>(onSignInBtnClick);
    on<OnSignInOnLoadEvent>(onSignInOnLoad);
    on<OnTextChangeEvent>(onTextChange);
  }

  FutureOr<void> onTextChange(OnTextChangeEvent event, Emitter<LoginState> emit) {
     bool isBtnEnabled = event.email.isNotEmpty && event.password.isNotEmpty && event.password.length>3;
     bool isEmailValid = validEmailRegex.hasMatch(event.email);
     if(isEmailValid){
       emit(OnSignInOnLoadState(isBtnEnabled: isBtnEnabled));
     }
     else{
       emit(LoginEmailErrorState());
     }


  }

  FutureOr<void> onSignInBtnClick(OnSignInBtnClickEvent event, Emitter<LoginState> emit) {

    emit(OnSignInBtnClickState());
  }


  FutureOr<void> onSignInOnLoad(OnSignInOnLoadEvent event, Emitter<LoginState> emit) {
    emit(OnSignInOnLoadState(isBtnEnabled: false));
  }
}
