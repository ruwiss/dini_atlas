import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/services/remote/daily_service.dart';
import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/home_tab_viewmodel.dart';
import 'package:flutter/material.dart';

class DailyContentsWidget extends StatelessWidget {
  const DailyContentsWidget({super.key, required this.viewModel});
  final HomeTabViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final contents = viewModel.contentsOfTime;
    if (contents == null) {
      return const SizedBox();
    } else {
      return Column(
        children: [
          verticalSpace(20),
          if (!viewModel.hideAyetContent)
            _contentView(
              metin: contents.ayet.metin,
              kaynak: contents.ayet.kaynak,
              type: DailyContentTypes.ayetler,
            ),
          if (!viewModel.hideHadisContent)
            _contentView(
              metin: contents.hadis.metin,
              kaynak: contents.hadis.kaynak,
              type: DailyContentTypes.hadisler,
            ),
          if (!viewModel.hideDuaContent)
            _contentView(
              metin: contents.dua,
              type: DailyContentTypes.dualar,
            ),
          if (!viewModel.hideBabyNamesContent) ...[
            _contentView(
              metin: contents.kizIsimleri,
              type: DailyContentTypes.kizIsimleri,
            ),
            _contentView(
              metin: contents.erkekIsimleri,
              type: DailyContentTypes.erkekIsimleri,
            ),
          ]
        ],
      );
    }
  }

  Widget _contentView(
      {required String metin,
      String? kaynak,
      required DailyContentTypes type}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      margin: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        borderRadius: borderRadiusMedium,
        color: kcBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type.whatIs,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: kcPrimaryColor,
                ),
              ),
              if (kaynak case final String kaynak)
                SizedBox(
                  width: 150,
                  child: Text(
                    kaynak,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
            ],
          ),
          verticalSpaceTiny,
          SelectableText(
            metin.removeHtmlTags(),
            style: const TextStyle(
              color: kcPrimaryColorDark,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
