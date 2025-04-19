part of 'action_cubit.dart';

@immutable
abstract class ActionState {}

class ActionInitial extends ActionState {}

class ActionLoading extends ActionState {}

class ActionAuthenticated extends ActionState {}

class ActionSuccess extends ActionState {
  final Map<String, dynamic> response;

  ActionSuccess(this.response);
}

class ActionError extends ActionState {
  final String message;

  ActionError(this.message);
}
