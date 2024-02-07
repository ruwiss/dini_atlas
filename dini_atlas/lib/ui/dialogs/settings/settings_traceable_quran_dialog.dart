import 'package:dini_atlas/models/quran/quran_reciter.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/widgets/selectable_tile.dart';
import 'package:flutter/material.dart';

import 'settings_dialog.dart';

class SettingsTraceableQuranDialog extends StatefulWidget {
  const SettingsTraceableQuranDialog({
    super.key,
    required this.quranReciters,
    required this.currentReciterId,
    this.onSelectedReciter,
  });
  final List<QuranReciter> quranReciters;
  final int currentReciterId;
  final Function(QuranReciter reciter)? onSelectedReciter;

  @override
  State<SettingsTraceableQuranDialog> createState() =>
      _SettingsTraceableQuranDialogState();
}

class _SettingsTraceableQuranDialogState
    extends State<SettingsTraceableQuranDialog> {
  int _selectedId = -1;

  @override
  void initState() {
    _selectedId = widget.currentReciterId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsBaseDialogItem(
      title: "Kur’an okuyucuları",
      svgIcon: kiEar,
      showDivider: false,
      bottomWidget: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 350),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.quranReciters.length,
          itemBuilder: (context, index) {
            final QuranReciter reciter = widget.quranReciters[index];
            return SettingsSelectableTile(
              value: reciter.id,
              text: reciter.name,
              selected: _selectedId == reciter.id,
              onTap: (value) {
                setState(() => _selectedId = reciter.id);
                widget.onSelectedReciter?.call(reciter);
              },
            );
          },
        ),
      ),
    );
  }
}
