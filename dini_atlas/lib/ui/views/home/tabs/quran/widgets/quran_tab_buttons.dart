import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';

class QuranTabButtons extends StatelessWidget {
  const QuranTabButtons({
    super.key,
    this.onIndexChanged,
    required this.currentIndex,
  });
  final Function(int id)? onIndexChanged;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _tabButton(id: 0, title: "Sûre"),
        _tabButton(id: 1, title: "Sayfa"),
        _tabButton(id: 2, title: "Takipli"),
      ],
    );
  }

  Widget _tabButton({required int id, required String title}) {
    final bool isActive = currentIndex == id;
    return InkWell(
      onTap: () => onIndexChanged?.call(id),
      splashColor: kcPurpleColorLight.withOpacity(.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isActive ? kcPrimaryColor : kcGrayColor,
              ),
            ),
          ),
          Container(
            height: 3.3,
            width: 88,
            color: isActive ? kcPrimaryColor : kcGrayColor.withOpacity(.1),
          )
        ],
      ),
    );
  }
}
