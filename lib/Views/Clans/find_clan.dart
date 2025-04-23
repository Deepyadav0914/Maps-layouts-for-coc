import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Apis/apis_calling.dart';

class ClanScreen extends StatelessWidget {
  ClanScreen({super.key});

  final TextEditingController controller =
      TextEditingController(text: '2LRGGRPVL');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Clan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller,
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
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ApiCall().clanData(controller.text.trim());
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
                    fontSize: 15.r,
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
