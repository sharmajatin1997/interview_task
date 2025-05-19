import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({super.key, required this.height, this.width, this.borderRadius, this.margin, this.shape, this.color});

  final double height;
  final double? width;
  final double? borderRadius;
  final Color? color;
  final BoxShape? shape;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: color??Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            margin: margin,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: shape == null ? BorderRadius.circular(borderRadius ?? 4) : null,
              shape: shape ?? BoxShape.rectangle,
            ),
          ),
        ],
      ),
    );
  }
}
