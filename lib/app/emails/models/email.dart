enum EmailStatus {
  sent,
  read,
  unread,
  starred,
  unstarred,
  archived,
  unarchived
}

class Email {
  String? email;
  String? subject;
  String? body;
  DateTime? date;
  String? senderEmail;
  String? senderName;
  String? senderPhotoUrl;
  String? receiverEmail;
  String? receiverName;
  String? receiverPhotoUrl;
  String? id;
  String? type;
  EmailStatus? status;
  bool? isImportant;

  Email({
    this.email,
    this.subject,
    this.body,
    this.date,
    this.senderEmail,
    this.senderName,
    this.senderPhotoUrl,
    this.receiverEmail,
    this.receiverName,
    this.receiverPhotoUrl,
    this.id,
    this.type,
    this.status,
    this.isImportant,
  });

  Email copyWith({
    String? email,
    String? subject,
    String? body,
    DateTime? date,
    String? senderEmail,
    String? senderName,
    String? senderPhotoUrl,
    String? receiverEmail,
    String? receiverName,
    String? receiverPhotoUrl,
    String? id,
    String? type,
    EmailStatus? status,
    bool? isImportant,
  }) {
    return Email(
      email: email ?? this.email,
      subject: subject ?? this.subject,
      body: body ?? this.body,
      date: date ?? this.date,
      senderEmail: senderEmail ?? this.senderEmail,
      senderName: senderName ?? this.senderName,
      senderPhotoUrl: senderPhotoUrl ?? this.senderPhotoUrl,
      receiverEmail: receiverEmail ?? this.receiverEmail,
      receiverName: receiverName ?? this.receiverName,
      receiverPhotoUrl: receiverPhotoUrl ?? this.receiverPhotoUrl,
      id: id ?? this.id,
      type: type ?? this.type,
      status: status ?? this.status,
      isImportant: isImportant ?? this.isImportant,
    );
  }

  Map<String, dynamic> toDoc() {
    return {
      'email': email,
      'subject': subject,
      'body': body,
      'date': date?.millisecondsSinceEpoch,
      'senderEmail': senderEmail,
      'senderName': senderName,
      'senderPhotoUrl': senderPhotoUrl,
      'receiverEmail': receiverEmail,
      'receiverName': receiverName,
      'receiverPhotoUrl': receiverPhotoUrl,
      'id': id,
      'type': type,
      'status': status?.name,
      'isImportant': isImportant,
    };
  }

  factory Email.fromMap(Map<String, dynamic> snap) {
    return Email(
      email: snap['email'],
      subject: snap['subject'],
      body: snap['body'],
      date: snap['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(snap['date'])
          : null,
      senderEmail: snap['senderEmail'],
      senderName: snap['senderName'],
      senderPhotoUrl: snap['senderPhotoUrl'],
      receiverEmail: snap['receiverEmail'],
      receiverName: snap['receiverName'],
      receiverPhotoUrl: snap['receiverPhotoUrl'],
      id: snap['id'],
      type: snap['type'],
      isImportant: snap['isImportant'],
    );
  }
}
