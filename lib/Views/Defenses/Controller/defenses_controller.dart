import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/defenses_model.dart';

class DefensesController extends GetxController {
  var defenses = Rxn<DefensesModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    defensesData();
    super.onInit();
  }

  Future<void> defensesData() async {
    try {
      isLoading(true);
      defenses.value = await ApiCall().defensesData();
      print("defenses data === ${defenses.value?.data[0].name}");
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}

class DefensesDetailsController extends GetxController {
  RxList<Datum> defensesData = <Datum>[].obs;
  RxInt detailIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxList details = [].obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments['item'];
    print('${arguments.runtimeType}');
    if (arguments is Datum) {
      defensesData.value = [arguments];
      print("maps data show == ${defensesData[0].details[0].level}");
      saveDetails();
    }
    isLoading.value = false;
  }

  void saveDetails() {
    final selectedDetail = defensesData[0].details[detailIndex.value];

    // Convert to map if needed, or access its fields dynamically
    final Map<String, dynamic> detailMap = selectedDetail.toJson();

    final filteredEntries = detailMap.entries.where((entry) {
      final key = entry.key;
      final value = entry.value.toString().trim();

      // Skip unwanted or empty/N/A/- values
      return value.isNotEmpty &&
          value != 'N/A' &&
          value != 'Null' &&
          key != 'image' &&
          key != 'Town Hall Image';
    }).toList();

    details.value = filteredEntries;

    // print("details == ${details}");
    update();
  }
}
