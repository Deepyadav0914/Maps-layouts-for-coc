import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/darkElixirTroops_model.dart';

class DarkTroopsController extends GetxController {
  var darkTroops = Rxn<DarkElixirTroopsModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    darkTroopsData();
    super.onInit();
  }

  Future<void> darkTroopsData() async {
    try {
      isLoading(true);
      darkTroops.value = await ApiCall().darkElixirTroopsData();
      print("darktroops data === ${darkTroops.value?.data[0].name}");
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}

class DarkTroopsDetailsController extends GetxController {
  RxList<Datum> darkTroopsData = <Datum>[].obs;
  RxInt detailIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxList details = [].obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments['item'];
    print('${arguments.runtimeType}');
    if (arguments is Datum) {
      darkTroopsData.value = [arguments];
      print("maps data show == ${darkTroopsData[0].details[0].level}");
      saveDetails();
    }
    isLoading.value = false;
  }

  void saveDetails() {
    final selectedDetail = darkTroopsData[0].details[detailIndex.value];

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
          key != 'image' &&
          key != 'Healing per Second' &&
          key != 'Healing per Pulse';
    }).toList();

    details.value = filteredEntries;

    // print("details == ${details}");
    update();
  }
}
