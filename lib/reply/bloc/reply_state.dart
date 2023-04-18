part of 'reply_bloc.dart';

abstract class ReplyState extends Equatable {
  final Email? email;
  const ReplyState({this.email});

  @override
  List<Object?> get props => [email];
}

class ReplyInitial extends ReplyState {}

class ReplyLoading extends ReplyState {}

class ReplyLoaded extends ReplyState {}

class ReplyError extends ReplyState {
  final String message;
  const ReplyError({required this.message});

  @override
  List<Object> get props => [message];
}

class ReplyStarted extends ReplyState {
  @override
  final Email email;
  const ReplyStarted({required this.email});

  @override
  List<Object> get props => [email];
}

class ReplySending extends ReplyState {
  @override
  final Email email;
  const ReplySending({required this.email});

  @override
  List<Object> get props => [email];
}

class ReplySent extends ReplyState {
  @override
  final Email email;
  const ReplySent({required this.email});

  @override
  List<Object> get props => [email];
}

class ReplyFailed extends ReplyState {
  final String message;
  const ReplyFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class ReplyCancelled extends ReplyState {}
