import 'package:get/get.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/cart_controller.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/image_controller.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/features/shop/models/product_veriation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// -- Select Attribute , and Variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    // When attribute is selected we will first and that attribute to the selectedAttribute
    final selectedAttribute =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttribute[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) =>
          _isSameAttributeValues(variation.attributeValues, selectedAttribute),
      orElse: () => ProductVariationModel.empty(),
    );

    // Show the selected Veriation image as a Main Image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    // Show selected variation quantity in the cart.
    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController
          .getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    // Assign Selected  Variation
    this.selectedVariation.value = selectedVariation;

    // Update selected Variation
    getProductVariationStockStatus();
  }

  /// -- Check if selected attribute matches any variation attribute
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    // If selectedAttribute contain 3 attributes and current variation contains 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    // if any of the attributes is different then return, eg [Green , large] x [Green , small]
    for (final key in variationAttributes.keys) {
      // Attributes[Key] = Value whick could be [Green , small cotton] etc
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  /// -- Check Attribute availability / Stock in Variation
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    // Pass the variation to check which attribute are available and stock is not 0
    final availableVariationAttributesValues = variations
        .where((variation) =>
            // Check Empty / Out od Stock Attributes
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        // Fetch all Non-empty attributes of variation
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributesValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  /// -- Check Product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// --  Reset Selected Attribute when switching product
  void resetSelectedAttribute() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
