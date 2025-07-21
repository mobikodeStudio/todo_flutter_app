import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/secure_data_storage.dart';
import '../../../core/secure_storage_keys.dart';
import '../../common/regex.dart';
import 'login_event.dart';
import 'login_state.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String? email;
  String? password;
  LoginBloc() : super(LoginInitial()) {
    on<OnSignInBtnClickEvent>(onSignInBtnClick);
    on<OnSignInOnLoadEvent>(onSignInOnLoad);
    on<OnTextChangeEvent>(onTextChange);
    on<OnSignUpOnClickEvent>(onSignUpClick);
  }

  FutureOr<void> onTextChange(OnTextChangeEvent event, Emitter<LoginState> emit) {
     bool isBtnEnabled = event.email.isNotEmpty &&
         event.password.isNotEmpty &&
         event.password.length>3;
     bool isEmailValid = validEmailRegex.hasMatch(event.email);
     email =event.email;
     password = event.password;
     if(isEmailValid && isBtnEnabled){
       emit(OnSignInOnLoadState(isBtnEnabled: isBtnEnabled));
     }
     else{
       emit(LoginEmailErrorState());
     }


  }

  FutureOr<void> onSignInBtnClick(OnSignInBtnClickEvent event, Emitter<LoginState> emit) {

    if(email!= null && password!=null){
      insetData(emailKey,email!);
      insetData(passwordKey,password!);
    }

    emit(OnSignInBtnClickState());
  }


  FutureOr<void> onSignInOnLoad(OnSignInOnLoadEvent event, Emitter<LoginState> emit) {
    emit(OnSignInOnLoadState(isBtnEnabled: false));
  }

  FutureOr<void> onSignUpClick(OnSignUpOnClickEvent event, Emitter<LoginState> emit){

      emit(OnSignUpOnClickState());
    }

}
