import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/services/remote/daily_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/home_tab_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

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
          if (!viewModel.hideSoruCevapContent)
            _contentView(
              title: contents.soruCevap.soru,
              metin: contents.soruCevap.cevap,
              type: DailyContentTypes.dualar,
            ),
          if (!viewModel.hideBabyNamesContent)
            _contentView(
              metin:
                  "Kız ismi: ${contents.kizIsim}\nErkek ismi: ${contents.erkekIsim}",
              type: DailyContentTypes.erkekIsimleri,
            ),
        ],
      );
    }
  }

  Widget _contentView(
      {required String metin,
      String? kaynak,
      String? title,
      required DailyContentTypes type}) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 14),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: borderRadiusMedium,
          color: kcBackgroundColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, .4),
              blurRadius: .6,
              color: kcGrayColor.withOpacity(.5),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title ?? type.whatIs,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: kcPrimaryColor,
                  ),
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
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Share.share(
                  "${title ?? type.whatIs}\n\n${metin.removeHtmlTags()}\n\n${kaynak != null ? '$kaynak\n\n' : ''}Dini Atlas uygulamasından: $ksAppUrl",
                );
              },
              child: const Text(
                "Paylaş",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
