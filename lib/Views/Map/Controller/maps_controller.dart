import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Apis/apis_calling.dart';
import '../../../Model/maps_model.dart';

class MapsController extends GetxController {
  var mapsModel = Rxn<MapsModel>();
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
      final result = await ApiCall().mapsData();
      mapsModel.value = result;
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
  late TabController tabController;

  final Map<String, List<Detail>> progressData = {};
  final Map<String, List<Detail>> trophyData = {};
  final Map<String, List<Detail>> warData = {};

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(vsync: this, length: 3);

    final arguments = Get.arguments['item'];
    if (arguments is MapListData) {
      mapData.value = [arguments];
      debugPrint("Maps data loaded: ${mapData.first.townhall.image}");
    }

    _groupDetailsByCategory();

    isLoading.value = false;

    debugPrint('PROGRESS count: ${progressData.length}');
    debugPrint('TROPHY count: ${trophyData.length}');
    debugPrint('WAR count: ${warData.length}');
  }

  void _groupDetailsByCategory() {
    if (mapData.isEmpty) return;

    final details = mapData.first.townhall.details;

    for (final detail in details) {
      bool isProgress = false;
      bool isTrophy = false;
      bool isWar = false;

      for (final category in detail.catagory) {
        switch (category.name) {
          case 'PROGRESS':
            isProgress = true;
            break;
          case 'TROPHY':
            isTrophy = true;
            break;
          case 'WAR':
            isWar = true;
            break;
        }
      }

      final key = detail.image;

      if (isProgress) {
        progressData.putIfAbsent(key, () => []).add(detail);
      }
      if (isTrophy) {
        trophyData.putIfAbsent(key, () => []).add(detail);
      }
      if (isWar) {
        warData.putIfAbsent(key, () => []).add(detail);
      }
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<void> launchURL(String url, BuildContext context) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      print(url);
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url'),
        ),
      );
    }
  }

  Future<void> onShareWithResult(BuildContext context, GlobalKey key) async {
    final RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;

    if (mapData.isEmpty || mapData[0].townhall.details.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No shareable content found.')),
      );
      return;
    }

    final cocUrl = mapData[0].townhall.details[0].cocUrl;

    if (cocUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('URL is empty, nothing to share.')),
      );
      return;
    }

    final Uri? uri = Uri.tryParse(cocUrl);

    try {
      final origin = box != null
          ? box.localToGlobal(Offset.zero) & box.size
          : Rect.fromLTWH(0, 0, 100, 100); // fallback

      if (uri != null && uri.hasScheme) {
        await Share.shareUri(
          uri,
          sharePositionOrigin: origin,
        );
      } else {
        await Share.share(
          cocUrl,
          sharePositionOrigin: origin,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sharing content: $e')),
      );
    }
  }
}
