import 'package:shopeasy_getx/features/shop/models/banner_model.dart';
import 'package:shopeasy_getx/features/shop/models/brand_model.dart';
import 'package:shopeasy_getx/features/shop/models/category_model.dart';
import 'package:shopeasy_getx/features/shop/models/product_attribute_model.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/features/shop/models/product_veriation_model.dart';
import 'package:shopeasy_getx/routes/routes.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';

class TDummyData {
  /// --- Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: true),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: false),
    BannerModel(
        imageUrl: TImages.banner3,
        targetScreen: TRoutes.favourites,
        active: false),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(
        imageUrl: TImages.banner5, targetScreen: TRoutes.setting, active: true),
    BannerModel(
        imageUrl: TImages.banner6,
        targetScreen: TRoutes.userAddress,
        active: false),
    BannerModel(
        imageUrl: TImages.banner7,
        targetScreen: TRoutes.checkout,
        active: false),
  ];

  /// --- User
  /// --- Cart
  /// --- Order
  /// --- List of All Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: TImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Cloths', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '8',
        name: 'Jewelery',
        image: TImages.jeweleryIcon,
        isFeatured: true),

    ///Subcategories
    CategoryModel(
        id: '14',
        name: 'Sport Shoe',
        image: TImages.sportIcon,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '9',
        name: 'Sports suits',
        parentId: '1',
        image: TImages.sportIcon,
        isFeatured: false),
    CategoryModel(
        id: '10',
        name: 'Sports Equipment',
        parentId: '1',
        image: TImages.sportIcon,
        isFeatured: false),

    //Furniture
    CategoryModel(
        id: '11',
        name: 'Bedroom Furniture',
        parentId: '5',
        image: TImages.furnitureIcon,
        isFeatured: false),
    CategoryModel(
        id: '12',
        name: 'Kitchen Furniture ',
        image: TImages.furnitureIcon,
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '13',
        name: 'Office Furniture',
        image: TImages.furnitureIcon,
        parentId: '5',
        isFeatured: false),

    //Electronic
    CategoryModel(
        id: '15',
        name: 'Laptop',
        image: TImages.electronicsIcon,
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '16',
        name: 'Mobile',
        image: TImages.electronicsIcon,
        parentId: '2',
        isFeatured: false),
  ];

  /// List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: TImages.nikeLogo,
        name: 'Nike',
        productsCount: 999,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: TImages.adidasLogo,
        name: 'Adida',
        productsCount: 999,
        isFeatured: true),
    BrandModel(
        id: '3',
        image: TImages.kenwoodLogo,
        name: 'Kenwood',
        productsCount: 999,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: TImages.ikeaLogo,
        name: 'IKEA',
        productsCount: 999,
        isFeatured: true),
    BrandModel(
        id: '5',
        image: TImages.appleLogo,
        name: 'Apple',
        productsCount: 999,
        isFeatured: true),
    BrandModel(
        id: '6',
        image: TImages.jordanLogo,
        name: 'Jordan',
        productsCount: 999,
        isFeatured: true),
    BrandModel(
        id: '7',
        image: TImages.acerlogo,
        name: 'Acer',
        productsCount: 999,
        isFeatured: true),
    BrandModel(
        id: '8',
        image: TImages.pumaLogo,
        name: 'Puma',
        productsCount: 999,
        isFeatured: true),
    BrandModel(
        id: '9',
        image: TImages.zaraLogo,
        name: 'Zara',
        productsCount: 999,
        isFeatured: true),
    BrandModel(
        id: '10',
        image: TImages.electronicsIcon,
        name: 'Samsung',
        productsCount: 999,
        isFeatured: true),
  ];

  /// List of all Brand Categories

  /// -- List of all  products
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike Sports Shoe',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage1,
        description: 'Green Nike Sports shoe',
        brand: BrandModel(
            id: '1',
            image: TImages.nikeLogo,
            name: 'Nike',
            productsCount: 265,
            isFeatured: true),
        images: [
          TImages.productImage1,
          TImages.productImage23,
          TImages.productImage21,
          TImages.productImage9
        ],
        salePrice: 55,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Red', 'Black']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 36']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '2',
              stock: 34,
              price: 134,
              salePrice: 122,
              image: TImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 34,
              price: 134,
              salePrice: 122,
              image: TImages.productImage23,
              attributeValues: {'Color': 'red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 34,
              price: 134,
              salePrice: 122,
              image: TImages.productImage1,
              attributeValues: {'Color': 'Green', 'Size': 'EU 36'}),
        ],
        productType: 'ProductType.variable'),
  ];
}
