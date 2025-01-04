import 'package:bloc/bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<ActivateUserEvent>((event, emit) {
      emit(UserLoadedState(event.user));
    });
    on<ChangeUserAgeEvent>((event, emit) {
      if (state.existUser) {
        final user = state.user!.copyWith(edad: event.age);
        emit(UserLoadedState(user));
      }
    });
    on<AddProfessionEvent>((event, emit) {
      if (state.existUser) {
        final user = state.user!.copyWith(profesiones: [
          ...state.user!.profesiones,
          event.profession,
        ]);
        emit(UserLoadedState(user));
      }
    });
    on<DeleteUserEvent>((event, emit) {
      emit(UserInitialState());
    });
  }
}
