// models/sport.dart
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:renconsport/services/trainings/sports/sportService.dart';

class Sport {
  final String? id;
  final String? name;
  final String? icon;
  final List<String>? exercices;
  final List<String> rounds;

  Sport(this.id, this.name, this.icon, this.exercices, this.rounds);

  Sport.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        icon = json['icon'] as String?,
        exercices = (json['exercices'] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
        rounds = (json['rounds'] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'exercices': exercices,
      'rounds': rounds,
    };
  }
}

final sportProvider = StateNotifierProvider<SportNotifier, List<Sport>>((ref) {
  return SportNotifier([]);
});

class SportNotifier extends StateNotifier<List<Sport>> {
  SportNotifier(List<Sport> state) : super(state);

  Future<void> fetchSports() async {
    try {
      List<dynamic> responseList = await SportService.getAllSportWithExercice();
      List<Map<String, dynamic>> fetchedSports =
          responseList.cast<Map<String, dynamic>>();
      List<Sport> sports =
          fetchedSports.map((sport) => Sport.fromJson(sport)).toList();

      state = sports;
    } catch (e) {
      print("Erreur lors de la récupération des sports : $e");
    }
  }
}
