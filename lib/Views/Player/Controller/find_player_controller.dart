import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/player_model.dart';

class PlayerDetailsController extends GetxController {
  /// Reactive player model (nullable)
  final Rxn<PlayerModel> playerModel = Rxn<PlayerModel>();

  /// Loading state
  final RxBool isLoading = true.obs;

  /// ID text controller (pre-filled with example tag)
  final TextEditingController idController =
      TextEditingController(text: '8CG2YC0JQ');

  @override
  void onInit() {
    super.onInit();
    fetchPlayerData();
  }

  /// Fetches player data based on current ID
  Future<void> fetchPlayerData() async {
    try {
      isLoading.value = true;

      final data = await ApiCall().playerData(idController.text);

      playerModel.value = data;
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }
}
