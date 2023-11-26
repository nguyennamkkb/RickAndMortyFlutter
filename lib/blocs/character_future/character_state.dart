
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class InitialUserState extends UserState {}

class LoadedUserDataState extends UserState {
  final String name;
  final String email;

  LoadedUserDataState(this.name, this.email);

  @override
  List<Object> get props => [name, email];
}

class ErrorUserState extends UserState {
  final String error;

  ErrorUserState(this.error);

  @override
  List<Object> get props => [error];
}