import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:renconsport/models/location/location.dart';
import 'package:renconsport/models/training/sport/sport.dart';
import 'package:renconsport/models/training/training.dart';
import 'package:renconsport/models/user/user.dart';

class TrainingDetail {
  final Training training;
  final Sport sport;
  final Location location;
  final User creator;

  TrainingDetail({
    required this.training,
    required this.sport,
    required this.location,
    required this.creator,
  });

  factory TrainingDetail.fromJson(Map<String, dynamic> json) {
    return TrainingDetail(
      training: Training.fromJson(json['training']),
      sport: Sport.fromJson(json['sport']),
      location: Location.fromJson(json['location']),
      creator: User.fromJson(json['creator']),
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
