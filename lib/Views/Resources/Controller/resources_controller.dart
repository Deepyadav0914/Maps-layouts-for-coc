import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/resources_model.dart';

class ResourcesController extends GetxController {
  var resources = Rxn<ResourcesModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    resourcesData();
    super.onInit();
  }

  Future<void> resourcesData() async {
    try {
      isLoading(true);
      resources.value = await ApiCall().resourcesData();
      print("resources data === ${resources.value?.data[0].name}");
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}

class ResourcesDetailsController extends GetxController {
  RxList<Datum> resourcesData = <Datum>[].obs;
  RxInt detailIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxList details = [].obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments['item'];
    print('${arguments.runtimeType}');
    if (arguments is Datum) {
      resourcesData.value = [arguments];
      print("resources data show == ${resourcesData[0].details[0].buildCost}");
      saveDetails();
    }
    isLoading.value = false;
  }

  void saveDetails() {
    final selectedDetail = resourcesData[0].details[detailIndex.value];

    // Convert to map if needed, or access its fields dynamically
    final Map<String, dynamic> detailMap = selectedDetail.toJson();

    final filteredEntries = detailMap.entries.where((entry) {
      final key = entry.key;
      final value = entry.value.toString().trim();

      // Skip unwanted or empty/N/A/- values
      return value.isNotEmpty &&
          value != 'N/A' &&
          value != '-' &&
          value != '-' &&
          value != '-' &&
          value != 'Null' &&
          value != 'Null' &&
          value != 'Null' &&
          key != 'image' &&
          key != 'Town Hall Image' &&
          key != 'Spell Capacity' &&
          key != 'Troop Capacity' &&
          key != 'Siege Machine Capacity' &&
          key != 'Laboratory Level Cap†' &&
          key != 'Storage Capacity';
    }).toList();

    details.value = filteredEntries;

    // print("details == ${details}");
    update();
  }
}
