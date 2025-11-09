import 'package:get/get.dart';
import 'package:hellobajar/screens/bottom_nav_bar/controller/api_service.dart';
import 'package:hellobajar/screens/bottom_nav_bar/model/home_screen_model.dart';

class GuestController extends GetxController {
  final ApiService _apiService = ApiService();

  var isLoading = true.obs;
  var homeResponse = HomeResponse().obs;

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  Future<void> fetchHomeData() async {
    try {
      isLoading(true);
      final data = await _apiService.fetchHomeData();
      if (data != null) {
        homeResponse.value = data;
      }
    } catch (e) {
      print("Error loading home data: $e");
    } finally {
      isLoading(false);
    }
  }
}
