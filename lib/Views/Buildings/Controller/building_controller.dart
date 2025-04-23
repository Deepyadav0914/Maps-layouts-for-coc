// import 'package:get/get.dart';
// import '../../../Apis/apis_calling.dart';
// import '../../../Model/armyBuildings_model.dart';
// import '../../../Model/darkElixirSpells_model.dart';
// import '../../../Model/darkElixirTroops_model.dart';
// import '../../../Model/defenses_model.dart';
// import '../../../Model/elixirSpells_model.dart';
// import '../../../Model/elixirTroops_model.dart';
// import '../../../Model/resources_model.dart';
// import '../../../Model/superTroops_model.dart';
//
// class BuildingDataController extends GetxController {
//   var armyBuildingsModel = Rxn<ArmyBuildingsModel>();
//   var elixirTroops = Rxn<ElixirTroopsModel>();
//   var elixirSpells = Rxn<ElixirSpellsModel>();
//   var darkTroops = Rxn<DarkElixirTroopsModel>();
//   var darkSpells = Rxn<DarkElixirSpellsModel>();
//   var resources = Rxn<ResourcesModel>();
//   var defenses = Rxn<DefensesModel>();
//   var superTroops = Rxn<SuperTroopsModel>();
//   var listData = Rxn();
//   RxBool isLoading = true.obs;
//
//   String getImageUrl(dynamic item) {
//     if (item == null) return '';
//
//     final mainImage = item.mainimage?.toString().trim();
//     final image = item.image?.toString().trim();
//
//     if (mainImage != null && mainImage.isNotEmpty) return mainImage;
//     if (image != null && image.isNotEmpty) return image;
//
//     // Optional: fallback to a default placeholder image URL
//     return 'https://via.placeholder.com/60x60.png?text=No+Image';
//   }
//
//   @override
//   void onInit() {
//     int index = Get.arguments["index"];
//     buildDetailsData(index);
//     super.onInit();
//   }
//
//   Future<void> buildDetailsData(int index) async {
//     try {
//       isLoading(true);
//       if (index == 0) {
//         armyBuildingsModel.value = await ApiCall().armyBuildingsData();
//         listData.value = armyBuildingsModel.value?.data;
//         print("data == ${listData.value}");
//       } else if (index == 1) {
//         resources.value = await ApiCall().resourcesData();
//         listData.value = resources.value?.data;
//         print("data == ${listData}");
//       } else if (index == 2) {
//         elixirTroops.value = await ApiCall().elixirTroopsData();
//         listData.value = elixirTroops.value?.data;
//         print("data == ${listData}");
//       } else if (index == 3) {
//         elixirSpells.value = await ApiCall().elixirSpellsData();
//         listData.value = elixirSpells.value?.data;
//         print("data == ${listData}");
//       } else if (index == 4) {
//         defenses.value = await ApiCall().defensesData();
//         listData.value = defenses.value?.data;
//         print("data == ${listData}");
//       } else if (index == 5) {
//         darkTroops.value = await ApiCall().darkElixirTroopsData();
//
//         listData.value = darkTroops.value?.data;
//         print("data == ${listData.value}");
//       } else if (index == 6) {
//         darkSpells.value = await ApiCall().darkElixirSpellsData();
//         listData.value = darkSpells.value?.data;
//         print("data darkSpells == ${listData.value}");
//       } else if (index == 7) {
//         superTroops.value = await ApiCall().superTroopsData();
//         listData.value = superTroops.value?.data;
//         print("data darkSpells == ${listData.value}");
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Failed to load data. Please try again.");
//     } finally {
//       isLoading(false);
//     }
//   }
// }
//
// class BuildingDetailsController extends GetxController {
//   RxList detailsData = [].obs;
//   RxInt detailIndex = 0.obs;
//   RxBool isLoading = true.obs;
//   RxList details = [].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     final data = Get.arguments['data'];
//
//     if (data is Detail) {
//       detailsData.value = [data];
//     } else if (data is List<Datum>) {
//       detailsData.value = data;
//     } else if (data is ArmyBuildingsModel) {
//       detailsData.value = data.data;
//     } else {
//       print('Unexpected data type: ${data.runtimeType}');
//     }
//
//     if (detailsData.isNotEmpty) {
//       saveDetails();
//     }
//
//     isLoading.value = false;
//   }
//
//
//   void saveDetails() {
//     final selectedDetail = detailsData[0].details[detailIndex.value];
//
//     // Convert to map if needed, or access its fields dynamically
//     final Map<String, dynamic> detailMap = selectedDetail.toJson();
//
//     final filteredEntries = detailMap.entries.where((entry) {
//       final key = entry.key;
//       final value = entry.value.toString().trim();
//
//       // Skip unwanted or empty/N/A/- values
//       return value.isNotEmpty &&
//           value != 'N/A' &&
//           value != 'Null' &&
//           value != 'Null' &&
//           key != 'image' &&
//           key != 'Healing per Second' &&
//           key != 'Healing per Pulse';
//     }).toList();
//
//     details.value = filteredEntries;
//
//     // print("details == ${details}");
//     update();
//   }
// }
