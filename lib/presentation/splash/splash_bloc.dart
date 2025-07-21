import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/secure_data_storage.dart';
import '../../core/secure_storage_keys.dart';


part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<InitialSplashLOadEvent>(onLoad);
  }

  Future<void> onLoad(InitialSplashLOadEvent event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    String? email =  await readData(emailKey);
    String? password = await readData(passwordKey);
    if(email!=null && password!=null){
      emit(SplashOnLoadState(isUserLoggedIn: true));
    }
    else{
      emit(SplashOnLoadState(isUserLoggedIn: false));
    }

  }
}
