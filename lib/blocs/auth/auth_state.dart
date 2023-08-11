part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authfailed extends AuthState {
  final String e;
  const Authfailed(this.e);
  @override
  List<Object> get props => [e];
}

final class AuthSuccess extends AuthState {
  final UserModel user;
  const AuthSuccess(this.user);
  @override
List<Object> get props => [user];
}
