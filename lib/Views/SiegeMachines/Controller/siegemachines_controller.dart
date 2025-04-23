import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/siegeMachines_model.dart';

class SiegeMachinesController extends GetxController {
  var siegeMachine = Rxn<SiegeMachinesModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    siegeMachineData();
    super.onInit();
  }

  Future<void> siegeMachineData() async {
    try {
      isLoading(true);
      siegeMachine.value = await ApiCall().siegeMachinesData();
      print("siegemachine data === ${siegeMachine.value?.data[0].name}");
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}

class SiegeMachinesDetailsController extends GetxController {
  RxList<Datum> siegeMachineData = <Datum>[].obs;
  RxInt detailIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxList details = [].obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments['item'];
    print('${arguments.runtimeType}');
    if (arguments is Datum) {
      siegeMachineData.value = [arguments];
      print("maps data show == ${siegeMachineData[0].cost}");
      saveDetails();
    }
    isLoading.value = false;
  }

  void saveDetails() {
    final selectedDetail = siegeMachineData[0].details[detailIndex.value];

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
          key != 'image' &&
          key != 'Damage per Attack' &&
          key != 'Damage when Destroyed' &&
          key != 'Wizards Spawned' &&
          key != 'Lifetime' &&
          key != 'Flame Maximum DPS' &&
          key != 'Point-Blank Damage*' &&
          key != 'P.E.K.K.A. Spawned';
    }).toList();

    details.value = filteredEntries;

    // print("details == ${details}");
    update();
  }
}
