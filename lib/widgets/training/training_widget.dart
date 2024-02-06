import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:renconsport/models/training/sport/sport.dart';
import 'package:renconsport/models/training/training_details.dart';
import 'package:renconsport/services/theme.dart';
import 'package:renconsport/widgets/searchBar/filtre.dart';

class TrainingList extends HookConsumerWidget {
  const TrainingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainingDetails = ref.watch(trainingDetailProvider);
    final sports = ref.watch(sportProvider);
    final sportNotifier = ref.read(sportProvider.notifier);
    List<String> searchResults = [];

    print(trainingDetails);

    useEffect(() {
      sportNotifier.fetchSports();
      return null;
    }, const []);

    return Scaffold(
      body: Center(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return Filter();
            },
          ));
        },
        child: Icon(Icons.search),
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
