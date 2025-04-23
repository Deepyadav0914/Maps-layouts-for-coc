import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: AnimationList(
            animationDirection: AnimationDirection.vertical,
            duration: 1600,
            children: ItemList.itemList.map((item) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.r),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 12.r),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueGrey.withOpacity(0.7),
                          Colors.black87,
                          Colors.blueGrey.withOpacity(0.9)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // CachedNetworkImage(
                        //   imageUrl: item.image,
                        //   height: 50.r,
                        //   fit: BoxFit.cover,
                        //   placeholder: (context, url) =>
                        //       LoadingAnimationWidget.inkDrop(
                        //     color: Colors.grey,
                        //     size: 25.r,
                        //   ),
                        // ),

                        10.w.horizontalSpace, // Add some spacing
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: 15.r,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Supercell',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.white,
                          size: 28.r,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}

class BuildGrid {
  final String name;

  BuildGrid({required this.name});
}

class ItemList {
  static final itemList = [
    BuildGrid(name: 'Privacy Policy'),
    BuildGrid(name: 'Rate us'),
    BuildGrid(name: 'Share App'),
    BuildGrid(name: 'Exit'),
  ];
}
