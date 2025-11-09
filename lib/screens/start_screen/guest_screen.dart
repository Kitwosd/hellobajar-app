import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/constants/api_base_url.dart';
import 'package:hellobajar/constants/constants.dart';
import 'package:hellobajar/screens/bottom_nav_bar/controller/home_screen_controller.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:hellobajar/utils/text_utils.dart';
import 'package:hellobajar/widget/search_bar_widget.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  final GuestController controller = Get.put(GuestController());
  final TextUtils textUtils = TextUtils();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final homeData = controller.homeResponse.value;

        if (homeData.categories == null ||
            homeData.featuredProducts == null ||
            homeData.bestOffersProducts == null) {
          return const Center(child: Text("No data available"));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Custom Header with Logo and SearchBar ---
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      'assets/hello_Bajar_Logo.png',
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

              const SizedBox(height: 15),

              // --- Sliders ---
              if (homeData.sliders != null && homeData.sliders!.isNotEmpty)
                CarouselSlider(
                  options: CarouselOptions(
                    height: Get.height * 0.22,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.95,
                  ),
                  items:
                      homeData.sliders!.map((slider) {
                        final imageUrl =
                            "https://hellobajar.com${slider.image!}";
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade200,
                                child: const Icon(
                                  Icons.broken_image,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                ),

              const SizedBox(height: 15),

              // --- Categories ---
              textUtils.textWidget(
                text: 'Categories',
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: Get.height * 0.13,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemCount: homeData.categories!.length,
                  itemBuilder: (context, index) {
                    final cat = homeData.categories![index];
                    final catImageUrl = "https://hellobajar.com${cat.image!}";

                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          '/productCategoriesScreen',
                          arguments: cat.id,
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                catImageUrl,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.broken_image,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          textUtils.textWidget(
                            text: cat.name ?? '',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // --- Featured Products ---
              _buildSectionTitle("Featured Products"),
              _buildProductGrid(homeData.featuredProducts!),

              const SizedBox(height: 20),

              // --- Best Offers ---
              _buildSectionTitle("Best Offers"),
              _buildProductGrid(homeData.bestOffersProducts!),

              const SizedBox(height: 30),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textUtils.textWidget(
          text: title,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        textUtils.textWidget(
          text: "View All",
          color: ColorConstant.secondaryColor,
          fontSize: 13.0,
        ),
      ],
    );
  }

  Widget _buildProductGrid(List products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 230,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        final productImageUrl = "https://hellobajar.com${product.mainImage!}";

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    productImageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textUtils.textWidget(
                      text: product.name ?? "",
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 2),
                    textUtils.textWidget(
                      text: "Rs ${product.price ?? ''}",
                      fontSize: 12,
                      color: ColorConstant.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
