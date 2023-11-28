// ignore: public_member_api_docs
class TraitementModel {
  // ignore: public_member_api_docs
  const TraitementModel({
    required this.traitementId,
    required this.patientId,
    required this.doctorId,
    required this.description,
  });

  // ignore: public_member_api_docs
  factory TraitementModel.fromJson(Map<String, dynamic> json) {
    return TraitementModel(
      traitementId: json['traitementId'] as int,
      patientId: json['patientId'] as int,
      doctorId: json['doctorId'] as int,
      description: json['description'] as String,
    );
  }

  // ignore: public_member_api_docs
  factory TraitementModel.fromRowAssoc(Map<String, String?> json) {
    return TraitementModel(
        traitementId: int.parse(json['traitementId']!),
        patientId: int.parse(json['patientId']!),
        doctorId: int.parse(json['doctorId']!),
        description: json['description']!);
  }

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() {
    return {
      'traitementId': traitementId.toString(),
      'patientId': patientId.toString(),
      'doctorId': doctorId.toString(),
      'description': description
    };
  }

  final int traitementId;
  final int patientId;
  final int doctorId;
  final String description;
}
