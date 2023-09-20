class Training {
  final String? id;
  final String? userId;
  final String? sportId;
  final DateTime? startedAt;
  final DateTime? finishedAt;
  final String? mode;
  // Ajoutez d'autres champs si nécessaire

  Training({
    this.id,
    this.userId,
    this.sportId,
    this.startedAt,
    this.finishedAt,
    this.mode,
  });

  factory Training.fromJson(Map<String, dynamic> json) {
    return Training(
      id: json['id'],
      userId: json['userId'],
      sportId: json['sportId'],
      startedAt:
          json['startedAt'] != null ? DateTime.parse(json['startedAt']) : null,
      finishedAt: json['finishedAt'] != null
          ? DateTime.parse(json['finishedAt'])
          : null,
      mode: json['mode'],
    );
  }
}
