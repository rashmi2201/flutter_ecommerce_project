import 'package:flutter_ecommerce_project/features/shop/models/banner_model.dart';
import 'package:flutter_ecommerce_project/features/shop/models/brand_model.dart';
import 'package:flutter_ecommerce_project/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_attribute_model.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_variation_model.dart';
import 'package:flutter_ecommerce_project/routes/routes.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';

class TDummyData {
//--banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.promoBanner1,
        targetScreen: TRoutes.order,
        active: false),
    BannerModel(
        imageUrl: TImages.promoBanner2,
        targetScreen: TRoutes.cart,
        active: false),
    BannerModel(
        imageUrl: TImages.promoBanner3,
        targetScreen: TRoutes.favourites,
        active: false),
    BannerModel(
        imageUrl: TImages.promoBanner4,
        targetScreen: TRoutes.search,
        active: false),
    BannerModel(
        imageUrl: TImages.promoBanner5,
        targetScreen: TRoutes.settings,
        active: false),
    BannerModel(
        imageUrl: TImages.promoBanner3,
        targetScreen: TRoutes.userAddress,
        active: false),
    BannerModel(
        imageUrl: TImages.promoBanner4,
        targetScreen: TRoutes.checkout,
        active: false),
  ];

//--user

// static final UserModel user=UserModel(
//   //id:'1' ,
//   firstName:'Rashmi',
//   lastNome: 'Bahadure',
//   email: 'rashmisunbright@gmail.com',
//   phoneNumber: '9518717885',
//   profilePicture: TImages.profileImage1,
// address:[
//   AddressModel(
//     id: '1',
//     name: 'Rashmi Bahadure',
//     phoneNumber:9518717885,
//     street:'82365 Timmy Coves',
//     city:'South Liana',
//     state: 'maine',
//     postalCode:'87885',
//     country:'USA',
// ),
//  AddressModel(
//     id: '2',
//     name: 'Leena Bahadure',
//     phoneNumber:9518717885,
//     street:'82365 linemo',
//     city:'South Liana',
//     state: 'maine',
//     postalCode:'87885',
//     country:'Russia',
// ),

// ]
// );

//cart

// static final CartModel cart=CartModel(
//   cartId:'001',
//   items:[
//     CartItemModel(
//       productId:'001',
//       varitionId:'1',
//       quantity:1,
//       title:products[0].title,
//       image:products[0].thumnail,
//       brandName:products[0].brand![0].name,
//       price:products[0].productVaritions![0].price,
//       selectedVarition:products[0].productVaritions![0].attributevalues,

//     ),
//      CartItemModel(
//       productId:'002',
//       varitionId:'2',
//       quantity:2,
//       title:products[0].title,
//       image:products[0].thumnail,
//       brandName:products[0].brand![0].name,
//       price:products[0].productVaritions![0].price,
//       selectedVarition:products[0].productVaritions![0].attributevalues,

//     ),
//  ]
// );

//order

  // static final List<OrderModel> orders=[
  //   OrderModel(
  //     id:'CWTOO12',
  //     status:OrderStatus.processing,
  //     items:cart.items,
  //     totalAmount:265,
  //     orderDate:DateTime(2023,09,1),
  //     deliveryDate:DateTime(2023,09,9)
  //     ),
  //       OrderModel(
  //     id:'CWTOO13',
  //     status:OrderStatus.processing,
  //     items:cart.items,
  //     totalAmount:369,
  //     orderDate:DateTime(2023,10,1),
  //     deliveryDate:DateTime(2023,10,8)
  //     ),

  // ];

  //list of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1',
        name: 'Sports',
        image: TImages.sportIcon,
        isFeatured: true,
        parentId: '1'),

    CategoryModel(
      id: '2',
      name: 'Furniture',
      image: TImages.furnitureIcon,
      isFeatured: true,
    ),

    CategoryModel(
      id: '3',
      name: 'Electronics',
      image: TImages.electronicIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      name: 'Clothes',
      image: TImages.clothIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Cosmatics',
      image: TImages.cosmaticIcon,
      isFeatured: true,
    ),

    // subcategories
    CategoryModel(
        id: '6',
        name: 'Sport',
        image: TImages.sportImage1,
        isFeatured: false,
        parentId: ""),
    CategoryModel(
        id: '7',
        name: 'Sports',
        image: TImages.sportImage2,
        isFeatured: false,
        parentId: ""),
    CategoryModel(
        id: '8',
        name: 'Sports',
        image: TImages.sportImage3,
        isFeatured: false,
        parentId: ""),

    // //furniture
    // CategoryModel(
    //     id: '9',
    //     name: 'Furniture',
    //     image: TImages.furnitureImage2,
    //     isFeatured: false),
    // CategoryModel(
    //     id: '10',
    //     name: 'Furniture',
    //     image: TImages.furnitureImage3,
    //     isFeatured: false),
    // CategoryModel(
    //     id: '11',
    //     name: 'Furniture',
    //     image: TImages.furnitureImage4,
    //     isFeatured: false),

    // //electronics
    // CategoryModel(
    //   id: '12',
    //   name: 'Electronics',
    //   image: TImages.electronicImage2,
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '13',
    //   name: 'Electronics',
    //   image: TImages.electronicImage3,
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '14',
    //   name: 'Electronics',
    //   image: TImages.electronicImage4,
    //   isFeatured: false,
    // ),
  ];

  // List of all brands
  static final List<BrandModel> brands = [
    BrandModel(
        id: 'HNM',
        image: TImages.productImage9,
        name: 'HNM',
        productsCount: 256,
        isFeatured: true),
    BrandModel(
        id: 'Levis',
        image: TImages.productImage8,
        name: 'Levis',
        productsCount: 256,
        isFeatured: true),
    BrandModel(
        id: 'BIBA',
        image: TImages.productImage10,
        name: 'BIBA',
        productsCount: 256,
        isFeatured: true),
    BrandModel(
        id: 'Furniture',
        image: TImages.furnitureImage1,
        name: 'Furniture',
        productsCount: 256,
        isFeatured: true),
    BrandModel(
        id: 'Electronics',
        image: TImages.electronicImage2,
        name: 'Electronics',
        productsCount: 256,
        isFeatured: true),
    BrandModel(
        id: 'Cosmatics',
        image: TImages.cosmaticImage3,
        name: 'Cosmatics', 
        productsCount: 256,
        isFeatured: true),
  ];

//--list of all products
  static final List<ProductModel> product = [
    ProductModel(
        id: '001',
        title: 'Brand Cotton Tshirt',
        stock: 15,
        price: 135,
        thumbnail: TImages.productImage1,
        productType: 'ProductType.variable',
        description: 'HNM',
        isFeatured: true,
        brand: BrandModel(
            id: 'HNM',
            image: TImages.productImage9,
            name: 'HNM',
            productsCount: 265,
            isFeatured: true),
        images: [
          //url passes images
          TImages.productImage2,
          TImages.productImage3,
          // TImages.productImage5,
          // TImages.productImage6,
          // TImages.productImage1,
        ],
        salePrice: 400,
        sku: 'ARB4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Brown']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 200,
              image: TImages.productImage1,
              description:
                  'This is a Product description for Loose Trend Tshirt',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 234,
              salePrice: 300,
              image: TImages.productImage2,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 7,
              price: 334,
              salePrice: 400,
              image: TImages.productImage5,
              attributeValues: {'Color': 'Brown', 'Size': 'EU 30'}),
        ]),
    ProductModel(
        id: '002',
        title: 'Loose Tshirt',
        stock: 15,
        price: 135,
        thumbnail: TImages.productImage5,
        productType: 'ProductType.single',
        description: 'Levis',
        isFeatured: true,
        brand: BrandModel(
            id: 'Levis',
            image: TImages.productImage8,
            name: 'Levis',
            productsCount: 265,
            isFeatured: true),
        images: [
          TImages.productImage2,
          TImages.productImage3,
          TImages.productImage4,
          TImages.productImage5,
          TImages.productImage6,
          TImages.productImage1,
        ],
        salePrice: 650,
        sku: 'ARB4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Blue', 'Pink']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage1,
              description:
                  'This is a Product description for Loose Trend Tshirt',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage2,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.productImage6,
              attributeValues: {'Color': 'Pink', 'Size': 'EU 34'}),
        ]),
    ProductModel(
        id: '003',
        title: 'Traditional Kurta',
        stock: 15,
        price: 135,
        thumbnail: TImages.productImage7,
        productType: 'ProductType.single',
        description: 'Traditional fab',
        isFeatured: true,
        brand: BrandModel(
            id: 'BIBA',
            image: TImages.productImage10,
            name: 'BIBA',
            productsCount: 265,
            isFeatured: true),
        images: [
          TImages.productImage2,
          TImages.productImage3,
          TImages.productImage4,
          TImages.productImage5,
          TImages.productImage6,
          TImages.productImage1,
        ],
        salePrice: 2000,
        sku: 'ARB4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Blue', 'Pink']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage1,
              description:
                  'This is a Product description for Loose Trend Tshirt',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage2,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.productImage6,
              attributeValues: {'Color': 'Pink', 'Size': 'EU 34'}),
        ]),
    ProductModel(
        id: '004',
        title: 'Furniture trend',
        stock: 15,
        price: 135,
        thumbnail: TImages.furnitureImage2,
        productType: 'ProductType.single',
        description: 'Traditional fab',
        isFeatured: true,
        brand: BrandModel(
            id: 'Furniture',
            image: TImages.productImage10,
            name: 'Furniture',
            productsCount: 265,
            isFeatured: true),
        images: [
          TImages.furnitureImage1,
          TImages.furnitureImage2,
          TImages.furnitureImage3,
          TImages.furnitureImage4,
          TImages.furnitureImage5,
          TImages.furnitureImage1,
        ],
        salePrice: 2000,
        sku: 'ARB4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Blue', 'Pink']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.furnitureImage2,
              description:
                  'This is a Product description for Loose Trend Tshirt',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.furnitureImage3,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.furnitureImage4,
              attributeValues: {'Color': 'Pink', 'Size': 'EU 34'}),
        ]),
    ProductModel(
        id: '005',
        title: 'Electronics vibe',
        stock: 15,
        price: 135,
        thumbnail: TImages.electronicImage1,
        productType: 'ProductType.single',
        description: 'Traditional fab',
        isFeatured: true,
        brand: BrandModel(
            id: 'Electronics',
            image: TImages.productImage10,
            name: 'Electronics',
            productsCount: 265,
            isFeatured: true),
        images: [
          TImages.electronicImage1,
          TImages.electronicImage2,
          TImages.electronicImage3,
          TImages.electronicImage4,
          TImages.electronicImage5,
          TImages.electronicImage2,
        ],
        salePrice: 2200,
        sku: 'ARB4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Blue', 'Pink']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.electronicImage2,
              description:
                  'This is a Product description for Loose Trend Tshirt',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.electronicImage3,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.electronicImage4,
              attributeValues: {'Color': 'Pink', 'Size': 'EU 34'}),
        ]),
    ProductModel(
        id: '006',
        title: 'Cosmatics',
        stock: 15,
        price: 135,
        thumbnail: TImages.cosmaticImage1,
        productType: 'ProductType.single',
        description: 'Makeup Collection ',
        isFeatured: true,
        brand: BrandModel(
            id: 'Cosmatics',
            image: TImages.productImage10,
            name: 'Cosmatics',
            productsCount: 265,
            isFeatured: true),
        images: [
          TImages.cosmaticImage1,
          TImages.cosmaticImage2,
          TImages.cosmaticImage3,
          TImages.cosmaticImage4,
          TImages.cosmaticImage2,
          TImages.cosmaticImage1,
        ],
        salePrice: 4000,
        sku: 'ARB4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Blue', 'Pink']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.cosmaticImage1,
              description:
                  'This is a Product description for Loose Trend Tshirt',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.cosmaticImage3,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.cosmaticImage3,
              attributeValues: {'Color': 'Pink', 'Size': 'EU 34'}),
        ]),
  ];
}
