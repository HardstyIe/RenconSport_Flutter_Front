enum LocationType {
  INDOOR,
  OUTDOOR,
}

class Location {
  final String? id;
  final String? userId;
  final String? trainingId;
  final String? name;
  final String? address;
  final LocationType? type;
  final double? latitude;
  final double? longitude;

  Location(
    this.id,
    this.userId,
    this.trainingId,
    this.name,
    this.address,
    this.type,
    this.latitude,
    this.longitude,
  );

  Location.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        userId = json['userId'] as String?,
        trainingId = json['trainingId'] as String?,
        name = json['name'] as String?,
        address = json['address'] as String?,
        type = json['type'] == 'INDOOR'
            ? LocationType.INDOOR
            : LocationType.OUTDOOR,
        latitude = json['latitude'] as double?,
        longitude = json['longitude'] as double?;
}
