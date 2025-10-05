import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafo_app/app_color.dart';

class AlertTile extends StatelessWidget {
  final String svgPath;
  final Color color;
  final String text;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double svgWidth;
  final double svgHeight;

  const AlertTile({
    super.key,
    required this.svgPath,
    required this.color,
    required this.text,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.all(12),
    this.svgWidth = 18,
    this.svgHeight = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColor.white
              )
            ),
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(
            svgPath,
            width: svgWidth,
            height: svgHeight,
          ),
        ],
      ),
    );
  }
}
