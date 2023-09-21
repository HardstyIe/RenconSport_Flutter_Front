import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:renconsport/models/location/location.dart';
import 'package:renconsport/models/training/sport/exercice/round/round.dart';
import 'package:renconsport/models/training/sport/sport.dart';
import 'package:renconsport/models/user/user.dart';

class TrainingDetail {
  final Sport? sport;
  final List<Round>? round;
  final Location? location;
  final User? user;
  final String? id;
  final String? userId;
  final String? sportId;
  final DateTime? startedAt;
  final DateTime? finishedAt;
  final String? mode;

  TrainingDetail({
    this.round,
    this.sport,
    this.location,
    this.user,
    this.id,
    this.userId,
    this.sportId,
    this.startedAt,
    this.finishedAt,
    this.mode,
  });

  factory TrainingDetail.fromJson(Map<String, dynamic> json) {
    return TrainingDetail(
      id: json['id'],
      userId: json['userId'],
      sportId: json['sportId'],
      startedAt:
          json['startedAt'] != null ? DateTime.parse(json['startedAt']) : null,
      finishedAt: json['finishedAt'] != null
          ? DateTime.parse(json['finishedAt'])
          : null,
      mode: json['mode'],
      round: (json['rounds'] as List<dynamic>)
          .map((item) => Round.fromJson(item as Map<String, dynamic>))
          .toList(),
      sport: Sport.fromJson(json['sport']),
      location: Location.fromJson(json['location']),
      user: User.fromJson(json['user']),
    );
  }
}

final trainingDetailProvider =
    StateNotifierProvider<TrainingDetailNotifier, List<TrainingDetail>>((ref) {
  return TrainingDetailNotifier([]);
});

class TrainingDetailNotifier extends StateNotifier<List<TrainingDetail>> {
  TrainingDetailNotifier(List<TrainingDetail> state) : super(state);

  void addTrainingDetail(TrainingDetail trainingDetail) {
    state = [...state, trainingDetail];
  }

  void updateTrainingDetails(List<TrainingDetail> newTrainingDetails) {
    state = newTrainingDetails;
  }
}
