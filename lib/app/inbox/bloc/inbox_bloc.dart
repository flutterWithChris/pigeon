import 'package:bloc/bloc.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:equatable/equatable.dart';
import 'package:pigeon/app/inbox/repo/inbox_repository.dart';
import 'package:pigeon/core/models/email.dart';

part 'inbox_event.dart';
part 'inbox_state.dart';

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final InboxRepository _inboxRepository;
  InboxBloc({required InboxRepository inboxRepository})
      : _inboxRepository = inboxRepository,
        super(InboxInitial()) {
    on<LoadInbox>((event, emit) async {
      emit(InboxLoading());
      Response<List<MimeMessage>> messages =
          await _inboxRepository.getInbox('christian.vergara531@gmail.com');
      List<Email> emails =
          messages.result!.map((e) => Email.fromMimeMessage(e)).toList();
      emit(InboxLoaded(emails: emails));
    });
  }
}
