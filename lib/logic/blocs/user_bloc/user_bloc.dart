// ignore_for_file: avoid_print

import 'package:flutter_application_1/logic/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/logic/repositories/user_repository.dart';
import 'package:flutter_application_1/models/user_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserInitialState()) {
    on<UserUpdateEvent>(_onUserUpdateEvent);
    on<UserFetchEvent>(_onUserFetchEvent);
    on<UserDeleteEvent>(_onUserDeleteEvent);
  }

  void _onUserFetchEvent(UserFetchEvent event, Emitter<UserState> emit) async {
    emit(UserFetchLoadingState());
    final fetchedUser = await _userRepository.fetchUser(event.userId);
    if (fetchedUser is UserProfile) {
      emit(UserFetchedState(fetchedUser));
    } else {
      emit(UserFetchErrorState(errorMessage: fetchedUser.toString()));
    }
  }

  void _onUserUpdateEvent(
      //TODO : Kodu açıkla ve yorum satırlarını ekle
      UserUpdateEvent event,
      Emitter<UserState> emit) async {
    print("girdi");
    emit(UserFetchLoadingState());
    print("loading state emit edildi");
    try {
      print("try içi");
      await _userRepository.updateUser(event.userProfile, event.userId);
      print("updateUser çağrıldı");
      emit(UserInitialState());
      print("UserInitialState emit edildi");
    } catch (e) {
      print(e);
      emit(UserUpdateErrorState(updateErrorMessage: e.toString()));
      print("UserUpdateErrorState emit edildi");
    }
  }

  void _onUserDeleteEvent(UserDeleteEvent event, Emitter<UserState> emit) {
    emit(UserInitialState());
  }
}
