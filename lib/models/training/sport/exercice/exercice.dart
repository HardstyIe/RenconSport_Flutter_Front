enum Difficulty { EASY, MEDIUM, HARD }

class Exercice {
  final String? id;
  final String? name;
  final Difficulty? difficulty;

  Exercice({
    this.id,
    this.name,
    this.difficulty,
  });

  factory Exercice.fromJson(Map<String, dynamic> json) {
    return Exercice(
      id: json['id'] as String?,
      name: json['name'] as String?,
      difficulty: Difficulty.values.firstWhere(
          (e) => e.toString() == 'Difficulty.' + json['difficulty']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'difficulty': difficulty?.toString().split('.').last,
    };
  }
}
