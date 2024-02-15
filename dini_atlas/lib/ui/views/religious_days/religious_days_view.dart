import 'package:dini_atlas/models/religious_days.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'religious_days_viewmodel.dart';

class ReligiousDaysView extends StackedView<ReligiousDaysViewModel> {
  const ReligiousDaysView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ReligiousDaysViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const AppBarWidget(title: "Dini Günler"),
      body: Center(
        child: viewModel.isBusy
            ? const Text("Yükleniyor")
            : Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 25),
                child: ListView.separated(
                  itemCount: viewModel.religiousDays.length,
                  itemBuilder: (context, index) {
                    final ReligiousDays item = viewModel.religiousDays[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _nameWidget(
                          item.day
                              .replaceAll("(", "")
                              .replaceAll(")", "")
                              .replaceAll(". Gün", ""),
                        ),
                        Flexible(
                          child: _timeWidget(item.date),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(color: kcBlueGrayColorSoft),
                ),
              ),
      ),
    );
  }

  Widget _timeWidget(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: kcBlueGrayColorSoft, width: 2.2),
      ),
      child: Text(
        time.replaceAll("i̇", "i"),
        softWrap: false,
        maxLines: 1,
        overflow: TextOverflow.fade,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }

  Widget _nameWidget(String name) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(24)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            kcPurpleColorLight.withOpacity(.5),
            kcBlueGrayColorSoft.withOpacity(.5),
            kcBackgroundColor
          ],
        ),
      ),
      child: Text(
        name,
        overflow: TextOverflow.fade,
        maxLines: 1,
        softWrap: false,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          color: kcPrimaryColorDark.withOpacity(.7),
        ),
      ),
    );
  }

  @override
  ReligiousDaysViewModel viewModelBuilder(BuildContext context) =>
      ReligiousDaysViewModel();

  @override
  void onViewModelReady(ReligiousDaysViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
