class SliderModel {
  final int id;
  final String type;
  final String image;

  SliderModel({
    required this.id,
    required this.type,
    required this.image,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'],
      type: json['type'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
