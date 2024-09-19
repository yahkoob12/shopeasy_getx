class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;
  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
      this.isFeatured,
      this.productsCount});

  ///Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  ///Convert Model to Json structure So that you can store data in Firebase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductionsCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  ///Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      image: data['Image'] ?? '',
      name: data['Name'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      productsCount: int.parse((data['ProductCount'] ?? 0).toString()),
    );
  }
}
