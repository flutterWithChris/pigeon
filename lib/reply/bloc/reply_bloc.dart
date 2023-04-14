import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pigeon/app/emails/models/email.dart';

part 'reply_event.dart';
part 'reply_state.dart';

class ReplyBloc extends Bloc<ReplyEvent, ReplyState> {
  ReplyBloc() : super(ReplyInitial()) {
    on<ReplyToEmail>(_onReplyToEmail);
    on<SendReply>(_onSendReply);
    on<CancelReply>(_onCancelReply);
  }

  void _onReplyToEmail(ReplyToEmail event, Emitter<ReplyState> emit) {
    emit(ReplyStarted(email: event.email));
  }

  void _onSendReply(SendReply event, Emitter<ReplyState> emit) async {
    emit(ReplyLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(ReplySent(email: event.email));
  }

  void _onCancelReply(CancelReply event, Emitter<ReplyState> emit) {
    emit(ReplyInitial());
  }
}
