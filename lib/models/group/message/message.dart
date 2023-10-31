class Message {
  final String? id;
  final String? groupId;
  final String? senderId;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Message({
    this.id,
    this.groupId,
    this.senderId,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      groupId: json['groupId'],
      senderId: json['senderId'],
      content: json['content'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}
