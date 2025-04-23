import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/elixirTroops_model.dart';

class ElixirTroopsController extends GetxController {
  var ElixirTroops = Rxn<ElixirTroopsModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    elixirTroopsData();
    super.onInit();
  }

  Future<void> elixirTroopsData() async {
    try {
      isLoading(true);
      ElixirTroops.value = await ApiCall().elixirTroopsData();
      print("ElixirTroops data === ${ElixirTroops.value?.data[0].name}");
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}

class ElixirTroopsDetailsController extends GetxController {
  RxList<Datum> ElixirTroopsData = <Datum>[].obs;
  RxInt detailIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxList details = [].obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments['item'];
    print('${arguments.runtimeType}');
    if (arguments is Datum) {
      ElixirTroopsData.value = [arguments];
      print("maps data show == ${ElixirTroopsData[0].details[0].level}");
      saveDetails();
    }
    isLoading.value = false;
  }

  void saveDetails() {
    final selectedDetail = ElixirTroopsData[0].details[detailIndex.value];

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
