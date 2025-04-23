import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/heroes_model.dart';

class HeroesController extends GetxController {
  var heroes = Rxn<HeroesModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    heroesData();
    super.onInit();
  }

  Future<void> heroesData() async {
    try {
      isLoading(true);
      heroes.value = await ApiCall().heroesData();
      print("heroes data === ${heroes.value?.data[0].name}");
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}

class HeroesDetailsController extends GetxController {
  RxList<Datum> heroesData = <Datum>[].obs;
  RxInt detailIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxList details = [].obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments['item'];
    print('${arguments.runtimeType}');
    if (arguments is Datum) {
      heroesData.value = [arguments];
      print("maps data show == ${heroesData[0].cost}");
      saveDetails();
    }
    isLoading.value = false;
  }

  void saveDetails() {
    final selectedDetail = heroesData[0].details[detailIndex.value];

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
          key != 'Ability Level' &&
          key != 'Builder Hall Level Required';
    }).toList();

    details.value = filteredEntries;

    // print("details == ${details}");
    update();
  }
}
