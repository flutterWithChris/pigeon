part of 'email_bloc.dart';

abstract class EmailState extends Equatable {
  final Email? email;
  const EmailState({this.email});

  @override
  List<Object?> get props => [email];
}

class EmailInitial extends EmailState {}

class EmailLoading extends EmailState {}

class EmailLoaded extends EmailState {
  @override
  final Email email;
  const EmailLoaded({required this.email}) : super(email: email);
}

class EmailError extends EmailState {
  final String message;
  const EmailError({required this.message}) : super();
}
