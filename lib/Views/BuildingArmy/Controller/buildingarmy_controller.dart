import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/armyBuildings_model.dart';

class BuildingArmyController extends GetxController {
  var buildArmy = Rxn<ArmyBuildingsModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    buildbuildArmyData();
    super.onInit();
  }

  Future<void> buildbuildArmyData() async {
    try {
      isLoading(true);
      buildArmy.value = await ApiCall().armyBuildingsData();
      print("buildArmy data === ${buildArmy.value?.data[0].name}");
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}

class BuildArmyDetailsController extends GetxController {
  RxList<Datum> buildArmyData = <Datum>[].obs;
  RxInt detailIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxList details = [].obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments['item'];
    print('${arguments.runtimeType}');
    if (arguments is Datum) {
      buildArmyData.value = [arguments];
      print("maps data show == ${buildArmyData[0].details[0].buildCost}");
      saveDetails();
    }
    isLoading.value = false;
  }

  void saveDetails() {
    final selectedDetail = buildArmyData[0].details[detailIndex.value];

    // Convert to map if needed, or access its fields dynamically
    final Map<String, dynamic> detailMap = selectedDetail.toJson();

    final filteredEntries = detailMap.entries.where((entry) {
      final key = entry.key;
      final value = entry.value.toString().trim();

      // Skip unwanted or empty/N/A/- values
      return value.isNotEmpty &&
          value != 'N/A' &&
          value != '-' &&
          value != 'Null' &&
          value != 'Null' &&
          key != 'image' &&
          key != 'Town Hall Image' &&
          key != 'Unlocked Unit Image' &&
          key != 'Unlocked Spell Image';
    }).toList();

    details.value = filteredEntries;

    // print("details == ${details}");
    update();
  }
}
