import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/darkElixirSpells_model.dart';

class DarkSpellsController extends GetxController {
  var darkSpells = Rxn<DarkElixirSpellsModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    darkSpellsData();
    super.onInit();
  }

  Future<void> darkSpellsData() async {
    try {
      isLoading(true);
      darkSpells.value = await ApiCall().darkElixirSpellsData();
      print("darkSpells data === ${darkSpells.value?.data[0].mainimage}");
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}

class DarkSpellsDetailsController extends GetxController {
  RxList<Datum> darkSpellsData = <Datum>[].obs;
  RxInt detailIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxList details = [].obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments['item'];
    print('${arguments.runtimeType}');
    if (arguments is Datum) {
      darkSpellsData.value = [arguments];
      print("maps data show == ${darkSpellsData[0].details[0].level}");
      saveDetails();
    }
    isLoading.value = false;
  }

  void saveDetails() {
    final selectedDetail = darkSpellsData[0].details[detailIndex.value];

    // Convert to map if needed, or access its fields dynamically
    final Map<String, dynamic> detailMap = selectedDetail.toJson();

    final filteredEntries = detailMap.entries.where((entry) {
      final key = entry.key;
      final value = entry.value.toString().trim();

      // Skip unwanted or empty/N/A/- values
      return value.isNotEmpty &&
          value != 'N/A' &&
          value != 'N/A' &&
          key != 'image' &&
          key != 'Duration';
    }).toList();

    details.value = filteredEntries;

    // print("details == ${details}");
    update();
  }
}
