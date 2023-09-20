import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:renconsport/models/training/trainings_details.dart';
import 'package:renconsport/services/trainings/trainingService.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

final loadTrainingDetailsProvider = FutureProvider<void>((ref) async {
  final trainingDetails =
      await TrainingService.getAllTraining(); // fonction pour récupérer toutes les données
  ref
      .read(trainingDetailProvider.notifier)
      .updateTrainingDetails(trainingDetails);
});
