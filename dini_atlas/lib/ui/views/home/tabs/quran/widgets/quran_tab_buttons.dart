import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/home/tabs/quran/quran_tab_viewmodel.dart';
import 'package:flutter/material.dart';

class QuranTabButtons extends StatelessWidget {
  const QuranTabButtons({
    super.key,
    this.onIndexChanged,
    required this.quranTab,
  });
  final Function(int id)? onIndexChanged;
  final QuranTabs quranTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(QuranTabs.values.length, (i) => _tabButton(i)),
    );
  }

  Widget _tabButton(int id) {
    final bool isActive = quranTab.id == id;
    return InkWell(
      onTap: () => onIndexChanged?.call(id),
      splashColor: kcPurpleColorLight.withOpacity(.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              QuranTabs.values[id].name,
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
