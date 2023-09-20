import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:renconsport/models/training/training_details.dart';
import 'package:renconsport/services/theme.dart';

class TrainingList extends HookConsumerWidget {
  const TrainingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainingDetails = ref.watch(trainingDetailProvider);
    print("Details: $trainingDetails");

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
          if (detail.sport?.icon != null) Icon(Icons.fitness_center),
          Column(
            children: [
              if (detail.user?.firstName != null) Text(detail.user!.firstName!),
              if (detail.location?.type != null)
                Text(detail.location!.type!.name)
            ],
          ),
          Column(
            children: [
              if (detail.startedAt != null)
                Column(
                  children: [
                    Text(
                        "Début : ${DateFormat('dd-MM HH:mm').format(DateTime.parse(detail.startedAt.toString()))}"),
                    Text(
                        "Fin : ${DateFormat('dd-MM HH:mm').format(DateTime.parse(detail.finishedAt.toString()))}"),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
