import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/army_model.dart';

class ArmyController extends GetxController {
  ArmyModel? armyModel;
  RxBool isLoading = true.obs;

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

class LevelController extends GetxController {
  var data = <Army>[].obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments['data'];
    print('${arguments.runtimeType}');
    if (arguments is List<Army>) {
      data.value = arguments;
      print("level data show == ${data[0].thLevel}");
    }
  }
}

class ArmyDetailController extends GetxController {
  RxList<Army> armyData = <Army>[].obs;
  RxInt index = 0.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments['item'];
    print('${arguments.runtimeType}');
    if (arguments is Army) {
      armyData.value = [arguments];
      print("maps data show == ${armyData[0].trophyLvl}");
    }
    isLoading.value = false;
  }
}
