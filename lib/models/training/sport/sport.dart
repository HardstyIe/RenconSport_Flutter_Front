class Sport {
  final String? id;
  final String? name;
  final String? icon;

  Sport(this.id, this.name, this.icon);

  Sport.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        icon = json['icon'] as String?;
}
