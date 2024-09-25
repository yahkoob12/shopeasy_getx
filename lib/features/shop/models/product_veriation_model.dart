class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;
  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  ///Create empty function for clean code

  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  ///Jsonformat
  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'price': price,
      'SalePrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  ///Map json oriented document snapshot from firebase to Model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id'] ?? '',
      price: double.parse((data['price'] ?? 0.0).toString()),
      sku: data['SKU'] ?? 0,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      image: data['Image'] ?? '',
      attributeValues: Map<String, String>.from(data['AttributeValues']),
    );
  }
}
