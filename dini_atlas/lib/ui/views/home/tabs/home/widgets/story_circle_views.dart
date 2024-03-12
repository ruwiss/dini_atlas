import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StoryCircleViews extends StatelessWidget {
  const StoryCircleViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _storyCircle(
              viewPercentage: .5,
              imageUrl:
                  "https://i.pinimg.com/736x/8e/18/66/8e1866670c3d7ae370ee09452ba00a51.jpg",
            ),
            _storyCircle(
              viewPercentage: 1,
              imageUrl:
                  "https://www.shutterstock.com/image-vector/vector-illustration-muslim-mosque-on-260nw-1173853915.jpg",
            ),
            _storyCircle(
              viewPercentage: .7,
              imageUrl:
                  "https://1.bp.blogspot.com/-i8gnwiMI5zs/YDYiz4yIKII/AAAAAAAABEo/62sNfBCWxbkdZN1aMoxabkIL3YQxHhIYACLcBGAsYHQ/s512/icon.png",
            ),
          ],
        ),
      ),
    );
  }

  Widget _storyCircle({
    required String imageUrl,
    required double viewPercentage,
    VoidCallback? onTap,
  }) {
    const double size = 55;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: size,
              width: size,
              child: CircularProgressIndicator(
                value: viewPercentage,
                color: kcPurpleColorMedium,
                backgroundColor: kcBlueGrayColor,
                strokeWidth: 4.5,
              ),
            ),
            Container(
              height: size,
              width: size,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kcBackgroundColor,
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
