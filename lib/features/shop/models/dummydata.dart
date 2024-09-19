import 'package:shopeasy_getx/features/shop/models/banner_model.dart';
import 'package:shopeasy_getx/features/shop/models/brand_model.dart';
import 'package:shopeasy_getx/features/shop/models/category_model.dart';
import 'package:shopeasy_getx/routes/routes.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';

class TDummyData {
  /// --- Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: false),
    BannerModel(
        imageUrl: TImages.banner3,
        targetScreen: TRoutes.favourites,
        active: false),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: false),
    BannerModel(
        imageUrl: TImages.banner5,
        targetScreen: TRoutes.setting,
        active: false),
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
}
