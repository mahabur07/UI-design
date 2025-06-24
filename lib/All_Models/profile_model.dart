class ProviderModel {
  final int id;
  final String fullName;
  final String? image;
  final double averageRating;

  ProviderModel({
    required this.id,
    required this.fullName,
    this.image,
    required this.averageRating,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      id: json['id'],
      fullName: json['full_name'] ?? '',
      image: json['image'],
      averageRating: double.tryParse(json['average_rating'] ?? '0.0') ?? 0.0,
    );
  }
}
