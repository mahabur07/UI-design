class ServiceModel {
  final int id;
  final String title;
  final String image;
  final double price;
  final double discountPrice;
  final String categoryName;
  final String providerName;
  final double averageRating;

  ServiceModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.discountPrice,
    required this.categoryName,
    required this.providerName,
    required this.averageRating,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: (json['price'] ?? 0).toDouble(),
      discountPrice: (json['discount_price'] ?? 0).toDouble(),
      categoryName: json['category']?['name'] ?? '',
      providerName: json['provider']?['full_name'] ?? json['admin']?['name'] ?? '',
      averageRating: double.tryParse(json['average_rating'] ?? '0.0') ?? 0.0,
    );
  }
}
