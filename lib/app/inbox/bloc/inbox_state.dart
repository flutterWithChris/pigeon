part of 'inbox_bloc.dart';

abstract class InboxState extends Equatable {
  const InboxState();

  @override
  List<Object> get props => [];
}

class InboxInitial extends InboxState {}

class InboxLoading extends InboxState {}

class InboxLoaded extends InboxState {
  final List<Email> emails;
  const InboxLoaded({required this.emails});
}

class InboxError extends InboxState {
  final String message;
  const InboxError({required this.message});
}
