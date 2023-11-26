// user_feature/event/user_event.dart

import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUserDataEvent extends UserEvent {}
