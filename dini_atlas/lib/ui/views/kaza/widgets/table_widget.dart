import 'package:dini_atlas/models/kaza/kaza.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/kaza/kaza_viewmodel.dart';
import 'package:flutter/material.dart';

class KazaTableWidget extends StatelessWidget {
  const KazaTableWidget({super.key, required this.viewModel});
  final KazaViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final Kaza? kaza = viewModel.kaza;
    if (kaza == null) return const SizedBox();
    return Column(
      children: [
        _tableContainer(
          children: [
            // Header
            _table1Header(),
            _tableItem(
              text: "Sabah",
              count: kaza.sabah,
              difference: viewModel.findDifference(KazaType.sabah),
              onDecrease: () =>
                  viewModel.updateKaza(kaza.copyWith(sabah: kaza.sabah - 1)),
              onIncrease: () =>
                  viewModel.updateKaza(kaza.copyWith(sabah: kaza.sabah + 1)),
            ),
            _tableItem(
              text: "Öğle",
              count: kaza.ogle,
              difference: viewModel.findDifference(KazaType.ogle),
              color: kcGrayColorLightSoft,
              onDecrease: () =>
                  viewModel.updateKaza(kaza.copyWith(ogle: kaza.ogle - 1)),
              onIncrease: () =>
                  viewModel.updateKaza(kaza.copyWith(ogle: kaza.ogle + 1)),
            ),
            _tableItem(
              text: "İkindi",
              count: kaza.ikindi,
              difference: viewModel.findDifference(KazaType.ikindi),
              onDecrease: () =>
                  viewModel.updateKaza(kaza.copyWith(ikindi: kaza.ikindi - 1)),
              onIncrease: () =>
                  viewModel.updateKaza(kaza.copyWith(ikindi: kaza.ikindi + 1)),
            ),
            _tableItem(
              text: "Akşam",
              count: kaza.aksam,
              difference: viewModel.findDifference(KazaType.aksam),
              color: kcGrayColorLightSoft,
              onDecrease: () =>
                  viewModel.updateKaza(kaza.copyWith(aksam: kaza.aksam - 1)),
              onIncrease: () =>
                  viewModel.updateKaza(kaza.copyWith(aksam: kaza.aksam + 1)),
            ),
            _tableItem(
              text: "Yatsı",
              count: kaza.yatsi,
              difference: viewModel.findDifference(KazaType.yatsi),
              onDecrease: () =>
                  viewModel.updateKaza(kaza.copyWith(yatsi: kaza.yatsi - 1)),
              onIncrease: () =>
                  viewModel.updateKaza(kaza.copyWith(yatsi: kaza.yatsi + 1)),
            ),
            _tableItem(
              text: "Vitir",
              count: kaza.vitir,
              difference: viewModel.findDifference(KazaType.vitir),
              color: kcGrayColorLightSoft,
              onDecrease: () =>
                  viewModel.updateKaza(kaza.copyWith(vitir: kaza.vitir - 1)),
              onIncrease: () =>
                  viewModel.updateKaza(kaza.copyWith(vitir: kaza.vitir + 1)),
            ),
            _multipleUpdateWidget(kaza),
          ],
        ),
        verticalSpaceMedium,
        _tableContainer(
          children: [
            _table2Header(),
            _tableItem(
              text: "Borç",
              count: kaza.oruc,
              onDecrease: () =>
                  viewModel.updateKaza(kaza.copyWith(oruc: kaza.oruc - 1)),
              onIncrease: () =>
                  viewModel.updateKaza(kaza.copyWith(oruc: kaza.oruc + 1)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _multipleUpdateWidget(Kaza kaza) {
    final int count = viewModel.kazaMultiCount;
    return _tableItem(
      text: "Toplu İşlem",
      count: count,
      isSpecial: true,
      onTapSpecialCount: viewModel.changeKazaMultiCount,
      onDecrease: () => viewModel.updateKaza(
        kaza.copyWith(
          sabah: kaza.sabah - count,
          ogle: kaza.ogle - count,
          ikindi: kaza.ikindi - count,
          aksam: kaza.aksam - count,
          yatsi: kaza.yatsi - count,
          vitir: kaza.vitir - count,
        ),
      ),
      onIncrease: () => viewModel.updateKaza(
        kaza.copyWith(
          sabah: kaza.sabah + count,
          ogle: kaza.ogle + count,
          ikindi: kaza.ikindi + count,
          aksam: kaza.aksam + count,
          yatsi: kaza.yatsi + count,
          vitir: kaza.vitir + count,
        ),
      ),
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
    int? difference,
    Color? color,
    bool isSpecial = false,
    VoidCallback? onTapSpecialCount,
  }) {
    return _tableCell(
      color: color ?? kcBackgroundColor,
      difference: difference,
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
        onTapSpecialCount: onTapSpecialCount,
      ),
    );
  }

  Widget _counterRow({
    VoidCallback? onDecrease,
    VoidCallback? onIncrease,
    required int count,
    bool isSpecial = false,
    VoidCallback? onTapSpecialCount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        _miniButton(text: "-", onTap: onDecrease),
        InkWell(
          onTap: () {
            if (isSpecial) onTapSpecialCount?.call();
          },
          child: Container(
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
          difference: viewModel.findDifference(KazaType.oruc),
          color: kcBlueGrayColorSoft,
        ),
        const Divider(height: 0, thickness: 1.2),
      ],
    );
  }

  Widget _tableCell({
    required Widget item1,
    Widget? item2,
    int? difference,
    Color color = kcBlueGrayColorSoft,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                item1,
                if (difference case final int diff)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      diff.isNegative ? "$diff    " : "+$diff    ",
                      style: TextStyle(
                          color: diff.isNegative ? Colors.red : Colors.green),
                    ),
                  ),
              ],
            ),
          ),
          if (item2 != null) Expanded(flex: 2, child: item2),
        ],
      ),
    );
  }
}
