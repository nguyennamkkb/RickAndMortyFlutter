  // user_feature/bloc/user_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'character_event.dart';
import 'character_state.dart';
import 'character_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository) : super(InitialUserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUserDataEvent) {
      try {
        final userData = await repository.fetchUserData();
        yield LoadedUserDataState(userData['name']!, userData['email']!);
      } catch (e) {
        yield ErrorUserState("Error fetching user data: $e");
      }
    }
  }
}
