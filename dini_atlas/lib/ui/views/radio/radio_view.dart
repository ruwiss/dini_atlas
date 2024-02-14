import 'package:dini_atlas/models/content_type.dart';
import 'package:dini_atlas/ui/views/radio/radio_service.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:dini_atlas/ui/widgets/content_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'radio_viewmodel.dart';

class RadioView extends StackedView<RadioViewModel> {
  const RadioView({super.key});

  @override
  Widget builder(
    BuildContext context,
    RadioViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const AppBarWidget(title: "Canlı Radyolar"),
      body: Center(
        child: viewModel.isBusy
            ? const CircularProgressIndicator()
            : viewModel.hasError
                ? Text("${viewModel.modelError}", textAlign: TextAlign.center)
                : Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: ListView.builder(
                      itemCount: viewModel.radios.length,
                      itemBuilder: (context, index) {
                        final RadioModel radio = viewModel.radios[index];
                        return ContentWidget(
                          type: ContentTypes.radioType(),
                          number: index + 1,
                          titleText: radio.name,
                          hideDivider: true,
                          isPlaying: viewModel.currentPlaying == radio.url,
                          isPlayerLoading:
                              viewModel.busy(viewModel.currentPlaying) &&
                                  viewModel.currentPlaying == radio.url,
                          onPlay: () => viewModel.playRadio(radio.url),
                          onPause: viewModel.pauseRadio,
                        );
                      },
                    )),
      ),
    );
  }

  @override
  RadioViewModel viewModelBuilder(BuildContext context) => RadioViewModel();

  @override
  void onViewModelReady(RadioViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
