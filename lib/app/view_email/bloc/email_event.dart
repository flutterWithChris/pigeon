part of 'email_bloc.dart';

abstract class EmailEvent extends Equatable {
  const EmailEvent();

  @override
  List<Object> get props => [];
}

class LoadEmail extends EmailEvent {
  final String id;
  const LoadEmail({required this.id});
}
