import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pigeon/app/emails/models/email.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc() : super(EmailInitial()) {
    on<EmailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
