part of 'splash_bloc.dart';

abstract class SplashState extends Equatable{}

final class SplashInitial extends SplashState {
  @override
  List<Object?> get props =>[];
}

final class SplashOnLoadState extends SplashState {
  final bool isUserLoggedIn;
  @override
  List<Object?> get props =>[isUserLoggedIn];

  SplashOnLoadState({required this.isUserLoggedIn});

}
