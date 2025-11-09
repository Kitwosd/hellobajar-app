import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:hellobajar/utils/text_utils.dart';
import 'package:hellobajar/widget/app_bar_widget.dart';

class ProductCategoriesScreen extends StatefulWidget {
  const ProductCategoriesScreen({super.key});

  @override
  State<ProductCategoriesScreen> createState() =>
      _ProductCategoriesScreenState();
}

class _ProductCategoriesScreenState extends State<ProductCategoriesScreen> {
  final TextUtils textUtils = TextUtils();

  // Left-side categories
  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.watch, "name": "Electronics"},
    {"icon": Icons.local_laundry_service, "name": "Clothing"},
    {"icon": Icons.food_bank, "name": "Food"},
    {"icon": Icons.local_drink, "name": "Beverage"},
    {"icon": Icons.spa, "name": "Book"},
    {"icon": Icons.health_and_safety, "name": "Health and Beauty"},
    {"icon": Icons.phone_android, "name": "Phones & Telecom"},
  ];

  // Right-side subcategories
  final Map<String, List<Map<String, String>>> subCategories = {
    "Electronics": [
      {"name": "Quartz Watches", "image": "assets/products/airpod.png"},
      {"name": "Creative Watches", "image": "assets/products/jacket.png"},
      {"name": "Mechanical Watches", "image": "assets/products/reak.png"},
      {"name": "Duel Display", "image": "assets/products/shoe.png"},
    ],
    "Clothing": [
      {"name": "Quartz Watches", "image": "assets/products/airpod.png"},
      {"name": "Creative Watches", "image": "assets/products/jacket.png"},
      {"name": "Mechanical Watches", "image": "assets/products/reak.png"},
      {"name": "Duel Display", "image": "assets/products/shoe.png"},
    ],
    "Food": [
      {"name": "Quartz Watches", "image": "assets/products/airpod.png"},
      {"name": "Creative Watches", "image": "assets/products/jacket.png"},
      {"name": "Mechanical Watches", "image": "assets/products/reak.png"},
      {"name": "Duel Display", "image": "assets/products/shoe.png"},
    ],
  };

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedCategory = categories[selectedIndex]['name'];
    final selectedSubCategories = subCategories[selectedCategory] ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget().appBar(
        // backgroundColor: ColorConstant.secondaryColor,
        title: "Category",
        fontWeight: FontWeight.w600,
        leadingIcon: Icons.arrow_back_ios,
        leadingAction: () {
          Get.toNamed('/bottomNavBar');
        },
      ),

      body: Row(
        children: [
          /// LEFT CATEGORY LIST
          Container(
            width: Get.width * 0.3,
            color: Colors.grey.shade100,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final item = categories[index];
                final bool isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    color: isSelected ? Colors.white : Colors.grey.shade100,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          item['icon'],
                          color:
                              isSelected
                                  ? ColorConstant.secondaryColor
                                  : Colors.grey,
                          size: 28,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.w400,
                            color:
                                isSelected
                                    ? ColorConstant.secondaryColor
                                    : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          /// RIGHT SUBCATEGORY GRID
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedCategory,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Navigate to view all
                        },
                        child: Text(
                          "All",
                          style: TextStyle(
                            color: ColorConstant.secondaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Subcategory Grid
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            mainAxisExtent: 180,
                          ),
                      itemCount: selectedSubCategories.length,
                      itemBuilder: (context, index) {
                        final subCat = selectedSubCategories[index];
                        return GestureDetector(
                          onTap: () {
                            // TODO: Go to subcategory products page
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      subCat['image']!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  child: Text(
                                    subCat['name']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
