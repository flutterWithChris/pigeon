import 'dart:math';

import 'package:pigeon/app/home/models/email.dart';

Random _random = Random();

List<Email> mockEmails = [
  for (int i = 0; i < 50; i++)
    Email(
      id: i.toString(),
      senderName: _senderNames[_random.nextInt(_senderNames.length)],
      senderEmail: _randomEmails[_random.nextInt(_randomEmails.length)],
      // senderPhotoUrl: _senderPhotoUrls[_random.nextInt(_senderPhotoUrls.length)],
      receiverName: _receiverNames[_random.nextInt(_receiverNames.length)],
      receiverEmail: _randomEmails[_random.nextInt(_randomEmails.length)],
      // receiverPhotoUrl:
      //     _receiverPhotoUrls[_random.nextInt(_receiverPhotoUrls.length)],
      subject: _subjects[_random.nextInt(_subjects.length)],
      body: _bodies[_random.nextInt(_bodies.length)],
      date: DateTime.now().subtract(Duration(days: _random.nextInt(3))),
      isImportant: _random.nextBool(),
      status: _random.nextBool() ? EmailStatus.unread : EmailStatus.unread,
      // type: _random.nextBool() ? EmailType.inbox : EmailType.sent,
    )
];

List<String> _senderNames = [
  "John Smith",
  "Emily Brown",
  "Oliver Jones",
  "Sophia Davis",
  "Jacob Taylor",
  "Isabella Martinez",
];

List<String> _receiverNames = [
  "Mary Johnson",
  "William Garcia",
  "Emma Wilson",
  "Michael Lee",
  "Ava Rodriguez",
  "Ethan Hernandez",
];
List<String> _randomEmails = [
  "imaginary@email.com",
  "greengoblin56@gmail.com",
  "cheebagold@email.com",
  "drz400@zmail.com",
  "sharkboy55@email.com",
  "ez45@rmail.com",
];

List<String> _subjects = [
  "Hello there",
  "Meeting agenda",
  "Important update",
  "Regarding your inquiry",
  "New product announcement",
  "Happy birthday!",
];

List<String> _bodies = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
  "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  "Et harum quidem rerum facilis est et expedita distinctio.",
  "Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus.",
];
