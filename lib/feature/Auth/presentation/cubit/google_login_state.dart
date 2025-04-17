part of 'google_login_cubit.dart';

abstract class GoogleLoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GoogleLoginInitial extends GoogleLoginState {}

class GoogleLoginLoading extends GoogleLoginState {}

class GoogleLoginSuccess extends GoogleLoginState {
  final User user;
  GoogleLoginSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class GoogleLoginFailure extends GoogleLoginState {
  final String error;
  GoogleLoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}
