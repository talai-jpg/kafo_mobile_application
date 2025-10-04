import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';

class StatsCard extends StatelessWidget {
  final String value;
  final String title;
  final String? backgroundImage; 


  const StatsCard({
    super.key,
    required this.value,
    required this.title,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 104,
        decoration: BoxDecoration(
          color: AppColor.tiffany,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
          
            if (backgroundImage != null)
              Positioned(
                left: 0,
                bottom: 0, 
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: AssetImage(backgroundImage!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
  
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      value,
                      style:  TextStyle(
                        fontSize: 28,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
