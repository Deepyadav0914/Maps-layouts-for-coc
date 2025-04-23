import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/pets_model.dart';

class PetsController extends GetxController {
  var pets = Rxn<PetsModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    petsData();
    super.onInit();
  }

  Future<void> petsData() async {
    try {
      isLoading(true);
      pets.value = await ApiCall().petsData();
      print("pets data === ${pets.value?.data[0].name}");
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}

class PetsDetailsController extends GetxController {
  RxList<Datum> petsData = <Datum>[].obs;
  RxInt detailIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxList details = [].obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments['item'];
    print('${arguments.runtimeType}');
    if (arguments is Datum) {
      petsData.value = [arguments];
      print("maps data show == ${petsData[0].cost}");
      saveDetails();
    }
    isLoading.value = false;
  }

  void saveDetails() {
    final selectedDetail = petsData[0].details[detailIndex.value];

    // Convert to map if needed, or access its fields dynamically
    final Map<String, dynamic> detailMap = selectedDetail.toJson();

    final filteredEntries = detailMap.entries.where((entry) {
      final key = entry.key;
      final value = entry.value.toString().trim();

      // Skip unwanted or empty/N/A/- values
      return value.isNotEmpty &&
          value != 'N/A' &&
          value != 'Null' &&
          value != 'Null' &&
          value != 'Null' &&
          value != 'Null' &&
          value != 'Null' &&
          value != 'Null' &&
          value != 'Null' &&
          value != 'Null' &&
          value != 'Null' &&
          value != 'Null' &&
          value != 'Null' &&
          value != 'Null' &&
          key != 'image' &&
          key != 'Damage vs. Walls' &&
          key != 'Healing per Second' &&
          key != 'Frostmites per Summon' &&
          key != 'Poison Max Damage per Second' &&
          key != 'Stun Duration' &&
          key != 'Poison Speed Decrease' &&
          key != 'Revive Duration' &&
          key != 'Brainwash Duration' &&
          key != 'Invisibility Duration' &&
          key != 'Poison Attack Rate Decrease' &&
          key != 'Maximum Frostmites Summoned' &&
          key != 'Healing per Pulse';
    }).toList();

    details.value = filteredEntries;

    // print("details == ${details}");
    update();
  }
}
