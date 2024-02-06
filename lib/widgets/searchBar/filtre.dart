import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:renconsport/models/training/sport/sport.dart';
import 'package:renconsport/models/training/training_details.dart';
import 'package:renconsport/models/user/user.dart';
import 'package:renconsport/services/trainings/trainingService.dart';

enum FlowStep { selectSport, selectExercice, configureSet }

class Filter extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sports = ref.watch(sportProvider);
    final sportNotifier = ref.read(sportProvider.notifier);
    final currentStep = useState(FlowStep.selectSport);
    final selectedSport = useState<Sport?>(null);
    final selectedExercice = useState<String?>(null);
    final searchController = useTextEditingController();
    final filteredSports = useState<List<Sport>>([]);
    final setConfig = useState<Map<String, dynamic>>({
      'reps': 0,
      'sets': 0,
      'duration': 0,
    });

    useEffect(() {
      final trainingDetailNotifier = ref.read(trainingDetailProvider.notifier);
      return null;
    }, const []);

    useEffect(() {
      filteredSports.value = sports
          .where((sport) => sport.name!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }, [searchController.text, sports]);

    void sendDataToAPI() {
      try {
        final selectedSportId = selectedSport.value?.id;
        final selectedTraining = ref.watch(trainingDetailProvider).firstOrNull;
        final currentUserId = ref.watch(userProvider).id;

        if (selectedTraining != null) {
          final selectedRounds = selectedTraining.round;
          final selectedLocationName = selectedTraining.location?.name;
          final selectedStartTime = selectedTraining.startedAt;
          final selectedEndTime = selectedTraining.finishedAt;
          final selectedMode = selectedTraining.mode;

          Map<String, dynamic> trainingData = {
            'sport': selectedSportId,
            'round': selectedRounds?.map((round) => round.toJson()).toList(),
            'location': selectedLocationName ?? 'Emplacement par défaut',
            'user': currentUserId,
            'startedAt': selectedStartTime?.toIso8601String(),
            'finishedAt': selectedEndTime?.toIso8601String(),
            'mode': selectedMode,
          };

          TrainingService.createTraining(trainingData);
          print("Entraînement créé avec succès");
        } else {
          print("Erreur lors de la création de l'entraînement: ");
        }
      } catch (error) {
        print("Aucune donnée de formation n'a été trouvée : $error");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Créer un entraînement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (currentStep.value == FlowStep.selectSport)
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Chercher un sport',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: PopupMenuButton<Sport>(
                    icon: Icon(Icons.arrow_drop_down),
                    onSelected: (Sport sport) {
                      selectedSport.value = sport;
                      currentStep.value = FlowStep.selectExercice;
                    },
                    itemBuilder: (BuildContext context) {
                      return filteredSports.value.map((Sport sport) {
                        return PopupMenuItem<Sport>(
                          value: sport,
                          child: Text(sport.name!),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            if (currentStep.value == FlowStep.selectExercice)
              DropdownButton<String>(
                hint: Text("Sélectionnez un exercice"),
                value: selectedExercice.value,
                onChanged: (String? newValue) {
                  selectedExercice.value = newValue!;
                  currentStep.value = FlowStep.configureSet;
                },
                items: selectedSport.value?.exercices
                    ?.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            if (currentStep.value == FlowStep.configureSet)
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nombre de répétitions',
                    ),
                    onChanged: (value) =>
                        setConfig.value['reps'] = int.tryParse(value),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nombre de sets',
                    ),
                    onChanged: (value) =>
                        setConfig.value['sets'] = int.tryParse(value),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Durée (en secondes)',
                    ),
                    onChanged: (value) =>
                        setConfig.value['duration'] = int.tryParse(value),
                  ),
                  ElevatedButton(
                    onPressed: sendDataToAPI,
                    child: Text("Envoyer"),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
