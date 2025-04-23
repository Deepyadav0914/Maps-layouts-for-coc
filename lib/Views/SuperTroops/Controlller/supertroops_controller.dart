import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/superTroops_model.dart';

class SuperTroopsController extends GetxController {
  var superTroops = Rxn<SuperTroopsModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    superTroopsData();
    super.onInit();
  }

  Future<void> superTroopsData() async {
    try {
      isLoading(true);
      superTroops.value = await ApiCall().superTroopsData();
      print("darktroops data === ${superTroops.value?.data[0].name}");
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}

class SuperTroopsDetailsController extends GetxController {
  RxList<Datum> superTroopsData = <Datum>[].obs;
  RxInt detailIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxList details = [].obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments['item'];
    print('${arguments.runtimeType}');
    if (arguments is Datum) {
      superTroopsData.value = [arguments];
      print("maps data show == ${superTroopsData[0].details[0].level}");
      saveDetails();
    }
    isLoading.value = false;
  }

  void saveDetails() {
    final selectedDetail = superTroopsData[0].details[detailIndex.value];

    // Convert to map if needed, or access its fields dynamically
    final Map<String, dynamic> detailMap = selectedDetail.toJson();

    final filteredEntries = detailMap.entries.where((entry) {
      final key = entry.key;
      final value = entry.value.toString().trim();

      // Skip unwanted or empty/N/A/- values
      return value.isNotEmpty &&
          value != 'N/A' &&
          key != 'image';
    }).toList();

    details.value = filteredEntries;

    // print("details == ${details}");
    update();
  }
}
