enum GroupType { PUBLIC, PRIVATE }

class Group {
  final String? id;
  final String? trainingId;
  final String? name;
  final GroupType? type;

  Group({
    this.id,
    this.trainingId,
    this.name,
    this.type,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'] as String?,
      trainingId: json['trainingId'] as String?,
      name: json['name'] as String?,
      type: GroupType.values
          .firstWhere((e) => e.toString() == 'GroupType.' + json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trainingId': trainingId,
      'name': name,
      'type': type?.toString().split('.').last,
    };
  }
}
