class VehicleModel {
  final String name;
  final String number;
  final String contact;
  final String location;
  final String description;
  final String acType;
  final String vehicleType;
  final String userId;
  final DateTime createdAt;

  VehicleModel({
    required this.name,
    required this.number,
    required this.contact,
    required this.location,
    required this.description,
    required this.acType,
    required this.vehicleType,
    required this.userId,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "number": number,
      "contact": contact,
      "location": location,
      "description": description,
      "acType": acType,
      "vehicleType": vehicleType,
      "userId": userId,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      name: json["name"] ?? '',
      number: json["number"] ?? '',
      contact: json["contact"] ?? '',
      location: json["location"] ?? '',
      description: json["description"] ?? '',
      acType: json["acType"] ?? '',
      vehicleType: json["vehicleType"] ?? '',
      userId: json["userId"] ?? '',
      createdAt:
          DateTime.parse(json["createdAt"] ?? DateTime.now().toIso8601String()),
    );
  }
}
