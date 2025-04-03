import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/maps_model.dart';

class MapsController extends GetxController {
  MapsModel? mapsModel;
  RxBool isLoading = true.obs;
  // String VarelaRound = 'VarelaRound';

  @override
  void onInit() {
    fetchMapsData();
    super.onInit();
  }

  Future<void> fetchMapsData() async {
    try {
      isLoading(true);
      mapsModel = await ApiCall().mapsData();
      print("mapmodal data === ${mapsModel?.data[0].townhall.image}");
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}

class MapsDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxList<MapListData> mapData = <MapListData>[].obs;
  RxInt index = 0.obs;
  RxBool isLoading = true.obs;
  late TabController tabController = TabController(vsync: this, length: 3);
  TextTheme? textTheme;
  final Map<String, List> progressData = {};
  final Map<String, List> trophyData = {};
  final Map<String, List> warData = {};

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments['item'];
    print('${arguments.runtimeType}');
    if (arguments is MapListData) {
      mapData.value = [arguments];
      print("maps data show == ${mapData.value[0].townhall.image}");
    }
    isLoading.value = false;

    final data = mapData[0];
    for (var i = 0; i < data.townhall.details.length; i++) {
      final detail = data.townhall.details[i];

      for (var category in detail.catagory) {
        if (category.name == 'PROGRESS') {
          final mapdata = detail.image; // Key for grouped data

          progressData.putIfAbsent(mapdata, () => []).add(detail);
          break; // Stop checking more categories after finding 'TROPHY'
        }
      }
      for (var category in detail.catagory) {
        if (category.name == 'TROPHY') {
          final mapdata = detail.image; // Key for grouped data

          trophyData.putIfAbsent(mapdata, () => []).add(detail);
          break; // Stop checking more categories after finding 'TROPHY'
        }
      }
      for (var category in detail.catagory) {
        if (category.name == 'WAR') {
          final mapdata = detail.image; // Key for grouped data

          warData.putIfAbsent(mapdata, () => []).add(detail);
          break; // Stop checking more categories after finding 'TROPHY'
        }
      }
    }

    print('Msg============${warData.length}');
  }

  @override
  void onClose() {
    // Fix: Use onClose instead of dispose
    tabController.dispose();
    super.onClose();
  }
}
