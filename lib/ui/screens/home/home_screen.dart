import 'package:epolisplus/utils/app_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenWidth * 0.3,
        leading: TextButton.icon(
            style: IconButton.styleFrom(highlightColor: Colors.transparent),
            icon: Icon(Icons.arrow_circle_left_outlined,
                color: Color(0xFF00A070), size: screenHeight * 0.028),
            onPressed: () {
              Navigator.pop(context);
            },
            label: Text(
              AppStrings.back,
              style: TextStyle(
                fontSize: screenHeight * 0.018,
                color: Color(0xFF00A070),
                fontWeight: FontWeight.w400,
              ),
            )),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.grey.shade200,
                    Colors.grey.shade300,
                    Colors.grey.shade400,
                    Colors.grey.shade500,
                  ],
                )),
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.grey.shade200,
                    Colors.grey.shade300,
                    Colors.grey.shade400,
                    Colors.grey.shade500,
                  ],
                )),
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.grey.shade200,
                    Colors.grey.shade300,
                    Colors.grey.shade400,
                    Colors.grey.shade500,
                  ],
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
