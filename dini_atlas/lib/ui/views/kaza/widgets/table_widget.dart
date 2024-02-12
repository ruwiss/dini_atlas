import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class KazaTableWidget extends StatelessWidget {
  const KazaTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _tableContainer(
          children: [
            // Header
            _table1Header(),
            _tableItem(
              text: "Sabah",
              count: 100,
              onDecrease: () {},
              onIncrease: () {},
            ),
            _tableItem(
              text: "Öğle",
              count: 100,
              color: kcGrayColorLightSoft,
              onDecrease: () {},
              onIncrease: () {},
            ),
            _tableItem(
              text: "İkindi",
              count: 100,
              onDecrease: () {},
              onIncrease: () {},
            ),
            _tableItem(
              text: "Akşam",
              count: 100,
              color: kcGrayColorLightSoft,
              onDecrease: () {},
              onIncrease: () {},
            ),
            _tableItem(
              text: "Yatsı",
              count: 100,
              onDecrease: () {},
              onIncrease: () {},
            ),
            _tableItem(
              text: "Vitir",
              count: 100,
              color: kcGrayColorLightSoft,
              onDecrease: () {},
              onIncrease: () {},
            ),
            _tableItem(
              text: "Toplu İşlem",
              count: 1,
              isSpecial: true,
              onDecrease: () {},
              onIncrease: () {},
            ),
          ],
        ),
        verticalSpaceMedium,
        _tableContainer(
          children: [
            _table2Header(),
            _tableItem(
              text: "Borç",
              count: 100,
              onDecrease: () {},
              onIncrease: () {},
            ),
          ],
        ),
      ],
    );
  }

  Container _tableContainer({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: kcBackgroundColor,
        borderRadius: borderRadiusMedium,
        boxShadow: [
          BoxShadow(
            color: kcShadowColor.withOpacity(.6),
            offset: const Offset(1, 1),
            blurRadius: 2,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadiusMedium,
        child: Column(mainAxisSize: MainAxisSize.min, children: children),
      ),
    );
  }

  Widget _tableItem({
    VoidCallback? onDecrease,
    VoidCallback? onIncrease,
    required String text,
    required int count,
    Color? color,
    bool isSpecial = false,
  }) {
    return _tableCell(
      color: color ?? kcBackgroundColor,
      item1: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isSpecial ? kcGrayColor : kcPrimaryColorDark,
        ),
      ),
      item2: _counterRow(
        count: count,
        onDecrease: onDecrease,
        onIncrease: onIncrease,
        isSpecial: isSpecial,
      ),
    );
  }

  Widget _counterRow({
    VoidCallback? onDecrease,
    VoidCallback? onIncrease,
    required int count,
    bool isSpecial = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        _miniButton(text: "-", onTap: onDecrease),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: isSpecial ? kcBlueGrayColorSoft : null,
            borderRadius: borderRadiusSmall,
          ),
          child: Text(
            "$count",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: isSpecial ? 17 : null,
              color: isSpecial ? kcGrayColor.withOpacity(.5) : kcGrayColor,
            ),
          ),
        ),
        _miniButton(text: "+", onTap: onIncrease),
      ],
    );
  }

  Widget _miniButton({VoidCallback? onTap, required String text}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          color: kcBlueGrayColorSoft,
          borderRadius: borderRadiusSmall,
        ),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _table1Header() {
    return Column(
      children: [
        _tableCell(
          item1: const Text("VAKİT"),
          item2: const Text("BORÇ", textAlign: TextAlign.center),
          color: kcBlueGrayColorSoft,
        ),
        const Divider(height: 0, thickness: 1.2),
      ],
    );
  }

  Widget _table2Header() {
    return Column(
      children: [
        _tableCell(
          item1: const Text("ORUÇ BORCU", textAlign: TextAlign.center),
          color: kcBlueGrayColorSoft,
        ),
        const Divider(height: 0, thickness: 1.2),
      ],
    );
  }

  Widget _tableCell({
    required Widget item1,
    Widget? item2,
    Color color = kcBlueGrayColorSoft,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 3, child: item1),
          if (item2 != null) Expanded(flex: 2, child: item2)
        ],
      ),
    );
  }
}
