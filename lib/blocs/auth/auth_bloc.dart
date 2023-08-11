import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layanan/models/sign_in_form_model.dart';
import 'package:layanan/models/sign_up_form_model.dart';
import 'package:layanan/models/user_model.dart';
import 'package:layanan/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      // TODO: implement event handler

      if(event is AuthLogin){
        try{
          emit(AuthLoading());
          final user = await AuthService().login(event.data);
          emit(AuthSuccess(user));
        }catch(e){
          emit(Authfailed(e.toString()));
        }
      }
      
    });
  }
}