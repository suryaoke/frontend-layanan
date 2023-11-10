import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:layanan/models/sign_in_form_model.dart';
import 'package:layanan/models/user_edit_model.dart';
import 'package:layanan/models/user_model.dart';
import 'package:layanan/services/auth_service.dart';
import 'package:layanan/services/user_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is AuthLogin) {
        try {
          emit(AuthLoading());
          final user = await AuthService().login(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(Authfailed(e.toString()));
        }
      }

      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());
          final SignInFormModel data =
              await AuthService().getCredentialFromLocal();
          final UserModel user = await AuthService().login(data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(Authfailed(e.toString()));
        }
      }

      if (event is AuthLogout) {
        try {
          emit(AuthLoading());
          await AuthService().logout();
          emit(AuthInitial());
        } catch (e) {
          emit(Authfailed(e.toString()));
        }
      }

      if (event is AuthUpdateUser) {
        try {
          if (state is AuthSuccess) {
            final updateUser = (state as AuthSuccess).user.copyWith(
                  username: event.data.username,
                  name: event.data.name,
                  email: event.data.email,
                  password: event.data.password,
                );
            emit(AuthLoading());
            await UserService().updateUser(event.data);

            emit(AuthSuccess(updateUser));
          }
        } catch (e) {
          emit(Authfailed(e.toString()));
        }
      }
    });
  }
}
