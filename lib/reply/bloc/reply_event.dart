part of 'reply_bloc.dart';

abstract class ReplyEvent extends Equatable {
  const ReplyEvent();

  @override
  List<Object> get props => [];
}

class ReplyToEmail extends ReplyEvent {
  final Email email;
  const ReplyToEmail({required this.email});

  @override
  List<Object> get props => [email];
}

class SendReply extends ReplyEvent {
  final Email email;
  const SendReply({required this.email});

  @override
  List<Object> get props => [email];
}

class CancelReply extends ReplyEvent {}
