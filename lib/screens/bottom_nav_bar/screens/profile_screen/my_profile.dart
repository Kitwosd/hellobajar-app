import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellobajar/screens/bottom_nav_bar/screens/profile_screen/controller/my_profile_controller.dart';
import 'package:hellobajar/utils/color_utils.dart';
import 'package:hellobajar/widget/app_bar_widget.dart';
import 'package:hellobajar/widget/button_widgets.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  // Use the permanent controller created in BottomNavBar
  final ProfileController controller = Get.find<ProfileController>();
  final ButtonWidget buttonWidget = ButtonWidget();

  @override
  void initState() {
    super.initState();
    controller.fetchProfile(); // Fetch profile using accessToken
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appBar(
        title: "My Profile",
        leadingIcon: Icons.arrow_back_ios,
        leadingAction: () {
          Get.back(); // Navigate back safely
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField("First Name", "first_name"),
            _buildTextField("Last Name", "last_name"),
            _buildTextField(
              "Email",
              "email",
              keyboardType: TextInputType.emailAddress,
            ),
            _buildTextField(
              "Phone",
              "phone",
              keyboardType: TextInputType.phone,
            ),
            _buildDropdown("Gender", "gender", const [
              "male",
              "female",
              "other",
            ]),
            _buildTextField("Address", "address"),
            _buildTextField("City", "city"),
            const SizedBox(height: 20),
            buttonWidget.buttonWidget(
              borderColor: ColorConstant.secondaryColor,
              btnColor: ColorConstant.secondaryColor,
              text: 'Save',
              textColor: ColorConstant.whiteColor,
              borderRadius: 30.0,
              actionPerform: () async {
                await controller.updateProfile();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Reactive TextField
  Widget _buildTextField(
    String label,
    String key, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Obx(
        () => TextFormField(
          initialValue: controller.profile[key]?.toString() ?? "",
          keyboardType: keyboardType,
          onChanged: (val) => controller.profile[key] = val,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

  /// Reactive Dropdown
  Widget _buildDropdown(String label, String key, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Obx(
        () => InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value:
                  controller.profile[key]?.isNotEmpty == true
                      ? controller.profile[key]
                      : null,
              isExpanded: true,
              items:
                  options
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
              onChanged: (val) => controller.profile[key] = val ?? "",
            ),
          ),
        ),
      ),
    );
  }
}
