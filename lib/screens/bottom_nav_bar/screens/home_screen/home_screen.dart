import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/constants/constants.dart';
import 'package:hellobajar/widget/search_bar_widget.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:hellobajar/utils/text_utils.dart';
import 'package:hellobajar/widget/button_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextUtils textUtils = TextUtils();
  ButtonWidget buttonWidget = ButtonWidget();

  final List<String> bannerImages = [
    'assets/banner_one.png',
    'assets/banner_one.png',
    'assets/banner_one.png',
    'assets/banner_one.png',
  ];

  final List<Map<String, String>> productList = [
    {
      'image': 'assets/products/airpod.png',
      'name': 'Wireless Earbuds',
      'price': '\$29.99',
    },
    {
      'image': 'assets/products/jacket.png',
      'name': 'Leather Jacket',
      'price': '\$59.99',
    },
    {
      'image': 'assets/products/reak.png',
      'name': 'Real Juice',
      'price': '\$0.99',
    },
    {
      'image': 'assets/products/shoe.png',
      'name': 'Sports Shoe',
      'price': '\$39.99',
    },
    {
      'image': 'assets/products/reak.png',
      'name': 'Real Juice',
      'price': '\$0.99',
    },
    {
      'image': 'assets/products/shoe.png',
      'name': 'Sports Shoe',
      'price': '\$39.99',
    },
    {
      'image': 'assets/products/shoe.png',
      'name': 'Sports Shoe',
      'price': '\$39.99',
    },
    {
      'image': 'assets/products/reak.png',
      'name': 'Real Juice',
      'price': '\$0.99',
    },
    {
      'image': 'assets/products/shoe.png',
      'name': 'Sports Shoe',
      'price': '\$39.99',
    },
    {
      'image': 'assets/products/airpod.png',
      'name': 'Wireless Earbuds',
      'price': '\$29.99',
    },
    {
      'image': 'assets/products/jacket.png',
      'name': 'Leather Jacket',
      'price': '\$59.99',
    },
    {
      'image': 'assets/products/reak.png',
      'name': 'Real Juice',
      'price': '\$0.99',
    },
    {
      'image': 'assets/products/shoe.png',
      'name': 'Sports Shoe',
      'price': '\$39.99',
    },
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,

      /// AppBar
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteColor,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(
                  Constants.helloBajarLogo,
                  height: 32,
                  width: 32,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: Get.height * 0.07,
                  child: SearchBarWidget(
                    hintText: "Search by category, service, or location..",
                    actionPerform: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      /// Scrollable body
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.01),

            /// Carousel Section
            CarouselSlider(
              options: CarouselOptions(
                height: Get.height * 0.2,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.95,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items:
                  bannerImages.map((imagePath) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  }).toList(),
            ),

            /// Dots Indicator
            SizedBox(height: Get.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  bannerImages.asMap().entries.map((entry) {
                    return Container(
                      width: _current == entry.key ? 10.0 : 8.0,
                      height: _current == entry.key ? 10.0 : 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _current == entry.key
                                ? Colors.blueAccent
                                : Colors.grey.shade400,
                      ),
                    );
                  }).toList(),
            ),

            SizedBox(height: Get.height * 0.01),
            textUtils.textWidget(
              text: 'Categories',
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
            SizedBox(height: Get.height * 0.02),

            // Horizontal Categories List
            SizedBox(
              height: Get.height * 0.14, // height for icon + label
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildCategoryItem(Icons.phone_android, "Mobiles"),
                  buildCategoryItem(Icons.tv, "Electronics"),
                  buildCategoryItem(Icons.chair, "Furniture"),
                  buildCategoryItem(Icons.sports_basketball, "Sports"),
                  buildCategoryItem(Icons.watch, "Watches"),
                  buildCategoryItem(Icons.book, "Books"),
                  buildCategoryItem(Icons.kitchen, "Kitchen"),
                ],
              ),
            ),

            ///  Flash Sale Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textUtils.textWidget(
                  text: 'Flash Sale',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                textUtils.textWidget(
                  text: 'SHOP MORE',
                  color: ColorConstant.secondaryColor,
                  fontSize: 13.0,
                ),
              ],
            ),

            SizedBox(height: 10),

            /// Product Grid (scrolls together with carousel)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 150,
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          product['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.0),
                    textUtils.textWidget(
                      text: product['name']!,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    textUtils.textWidget(
                      text: product['price']!,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.secondaryColor,
                    ),
                  ],
                );
              },
            ),

            SizedBox(height: Get.height * 0.02),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryItem(IconData icon, String name) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/productCategoriesScreen');
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 28, color: ColorConstant.primaryColor),
            ),
          ),
          SizedBox(height: 5),
          textUtils.textWidget(
            text: name,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            // color: ColorConstant.secondaryColor,
          ),
        ],
      ),
    );
  }
}
