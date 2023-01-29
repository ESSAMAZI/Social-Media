class MessageModle {
  String? senderId;
  String? reciverId;
  String? dateTime;
  String? text;

  MessageModle({
    this.senderId,
    this.reciverId,
    this.dateTime,
    this.text,
  });

  MessageModle.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    reciverId = json['reciverId'];
    dateTime = json['dateTime'];
    text = json['text'];
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'reciverId': reciverId,
      'dateTime': dateTime,
      'text': text,
    };
  }
}
