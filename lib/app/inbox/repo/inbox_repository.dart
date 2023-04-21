import 'package:enough_mail/enough_mail.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class InboxRepository {
  Future<Response<List<MimeMessage>>> getInbox(String email) async {
    print('discovering settings for $email');
    final ImapClient client = ImapClient(isLogEnabled: true);

    try {
      await client.connectToServer('imap.gmail.com', 993);
      await client.login(email, dotenv.get('MAGNOLIA_IB'));
      var mailBoxes = await client.listMailboxes();
      print('mailboxes: $mailBoxes');
      var inbox = await client.selectInbox();
      print('inbox: $inbox');
      var fetchResult = await client.fetchRecentMessages(
        messageCount: 25,
      );
      for (var message in fetchResult.result!) {
        print('message: ${message.subject}');
      }
      return fetchResult;
    } catch (e) {
      print('error: $e');
      rethrow;
    } finally {
      await client.logout();
    }
  }
}
