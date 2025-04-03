import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/army_model.dart';

class ArmyController extends GetxController {
  ArmyModel? armyModel;
  RxBool isLoading = true.obs;
  // String VarelaRound = 'VarelaRound';

  @override
  void onInit() {
    fetchMapsData();
    super.onInit();
  }

  Future<void> fetchMapsData() async {
    try {
      isLoading(true);
      armyModel = await ApiCall().armyData();
      print("ArmyModel data === ${armyModel?.data[0].thLevel}");
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}
