import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/attackStrategies_model.dart';

class AttackStrategiesController extends GetxController {
  List<AttackStrategiesModel>? attacks;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    attacksData();
    super.onInit();
  }

  Future<void> attacksData() async {
    try {
      isLoading(true);
      attacks = await ApiCall().attackStrategiesData();
      print("attacks data === ${attacks?[0].name}");
    } catch (e) {
      Get.snackbar("Error", "Failed to load data. Please try again.");
    } finally {
      isLoading(false);
    }
  }
}

class AttackStrategiesDetailController extends GetxController {
  RxList<AttackStrategiesModel> attacksData = <AttackStrategiesModel>[].obs;
  RxInt index = 0.obs;
  RxBool isLoading = true.obs;

  late YoutubePlayerController youtubecontroller;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments['item'];
    print('${arguments.runtimeType}');
    if (arguments is AttackStrategiesModel) {
      attacksData.value = [arguments];
      print("attacks data show == ${attacksData[0].author}");

      final videoId =
          YoutubePlayerController.convertUrlToId(attacksData[0].videoUrl);

      print("msg ===$videoId");
      if (videoId != null) {
        youtubecontroller = YoutubePlayerController.fromVideoId(
          videoId: videoId,
          autoPlay: true,
          params: const YoutubePlayerParams(
            loop: true,
            mute: false,
            showControls: true,
            showFullscreenButton: true,
          ),
        );
      }
    }
    isLoading.value = false;
  }
}
