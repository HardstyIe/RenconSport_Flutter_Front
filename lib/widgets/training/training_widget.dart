import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:renconsport/models/training/trainings_details.dart';
import 'package:renconsport/provider/state.dart';
import 'package:renconsport/services/theme.dart';

class TrainingList extends HookConsumerWidget {
  const TrainingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final cancelToken = CancelToken();
      // Supposons que la méthode accepte un CancelToken pour annuler la requête
      ref.read(loadTrainingDetailsProvider.future);
      return () => cancelToken.cancel();
    }, []);

    final trainingDetails = ref.watch(trainingDetailProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            _buildTitle(),
            SizedBox(height: 20),
            ...trainingDetails
                .map((detail) => _buildTrainingItem(detail))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Nos séances d'entraînements",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTrainingItem(TrainingDetail detail) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: CustomTheme.primaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (detail.sport.icon != null)
            Image.network(
              detail.sport.icon!,
              width: 50,
              height: 20,
            ),
          if (detail.location.name != null) Text(detail.location.name!),
          Column(
            children: [
              if (detail.creator.firstName != null)
                Text(detail.creator.firstName!),
              if (detail.sport.name != null) Text(detail.sport.name!),
            ],
          ),
        ],
      ),
    );
  }
}
