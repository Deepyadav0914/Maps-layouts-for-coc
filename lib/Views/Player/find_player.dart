import 'package:coc_app/Apis/apis_calling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Routes/name_routes.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({super.key});

  final TextEditingController controller =
      TextEditingController(text: '8CG2YC0JQ');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next, // Change keyboard action
              autocorrect: false, // Disable autocorrection
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Supercell',
                fontSize: 14.r,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                prefixIconColor: Colors.white,
                labelText: 'Enter Id',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Supercell',
                  fontSize: 14.r,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20.r),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ApiCall().playerData(controller.text.trim());
                  Get.toNamed(AppName.playerDetail);
                },
                icon: Icon(
                  Icons.person_search,
                  color: Colors.white,
                  size: 22.r,
                ),
                label: Text(
                  'Find Id',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Supercell',
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade300,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
