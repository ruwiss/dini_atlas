import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/rosary/widgets/count_set_widget.dart';
import 'package:dini_atlas/ui/views/rosary/widgets/counter_actions.dart';
import 'package:dini_atlas/ui/views/rosary/widgets/counter_widget.dart';
import 'package:dini_atlas/ui/views/rosary/widgets/rosary_setting_buttons.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'rosary_viewmodel.dart';

class RosaryView extends StackedView<RosaryViewModel> {
  const RosaryView({super.key});

  @override
  Widget builder(
    BuildContext context,
    RosaryViewModel viewModel,
    Widget? child,
  ) {
    final darkMode = !viewModel.isBusy && viewModel.darkMode;
    return Scaffold(
      backgroundColor: darkMode
          ? kcBlackBackground
          : Theme.of(context).colorScheme.background,
      appBar: AppBarWidget(
        title: "Tesbih",
        titleColor: darkMode ? kcGrayColorSoft : null,
        backgroundColor: darkMode ? kcBlackBackground : null,
        actions: [
          IconButton(
            onPressed: viewModel.toggleTheme,
            icon: SvgPicture.asset(kiMoon),
          ),
        ],
      ),
      body: Center(
        child: viewModel.isBusy
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      // Kaç set olduğunu gösteren widget
                      RosaryCountSetWidget(viewModel: viewModel),
                      verticalSpaceMedium,
                      // Sayacı gösteren widget
                      RosaryCounterWidget(viewModel: viewModel),
                      verticalSpace(30),
                      // Sayaç arttırma ve reset butonu
                      RosaryCounterActionsWidget(viewModel: viewModel),
                      verticalSpaceSmall,
                      // Ses, titreşim ayarları
                      RosarySettingButtons(viewModel: viewModel),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  @override
  RosaryViewModel viewModelBuilder(BuildContext context) => RosaryViewModel();

  @override
  void onViewModelReady(RosaryViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
