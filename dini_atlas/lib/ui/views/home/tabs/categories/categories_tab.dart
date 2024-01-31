import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/home/tabs/categories/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          itemCount: categoryItems.length,
          padding: const EdgeInsets.symmetric(vertical: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            final CategoryItem item = categoryItems[index];
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                print(item.id);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Card
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: item.color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  // Icon
                  Opacity(
                    opacity: .6,
                    child: SvgPicture.asset(item.image),
                  ),
                  // Text
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: kcPurpleColorDarkSoft,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
