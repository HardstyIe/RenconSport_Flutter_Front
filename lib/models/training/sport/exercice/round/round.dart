class Round {
  final String? id;
  final String? trainingId;
  final String? exerciceId;
  final int? duration;
  final int? sets;
  final int? repetitions;
  final double? weight;

  Round({
    this.id,
    this.trainingId,
    this.exerciceId,
    this.duration,
    this.sets,
    this.repetitions,
    this.weight,
  });

  factory Round.fromJson(Map<String, dynamic> json) {
    return Round(
      id: json['id'] as String?,
      trainingId: json['trainingId'] as String?,
      exerciceId: json['exerciceId'] as String?,
      duration: json['duration'] as int?,
      sets: json['sets'] as int,
      repetitions: json['repetitions'] as int?,
      weight: json['weight'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trainingId': trainingId,
      'exerciceId': exerciceId,
      'duration': duration,
      'sets': sets,
      'repetitions': repetitions,
      'weight': weight,
    };
  }
}
