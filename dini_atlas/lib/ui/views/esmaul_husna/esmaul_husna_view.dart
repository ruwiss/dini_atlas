import 'package:dini_atlas/models/content_type.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:dini_atlas/ui/widgets/banner_ad_widget.dart';
import 'package:dini_atlas/ui/widgets/content_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'esmaul_husna_viewmodel.dart';

class EsmaulHusnaView extends StackedView<EsmaulHusnaViewModel> {
  const EsmaulHusnaView({super.key});

  @override
  Widget builder(
    BuildContext context,
    EsmaulHusnaViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const AppBarWidget(
        title: "Esma’ül Hüsna",
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FutureBuilder<List<EsmaulHusna>>(
            future: viewModel.getEsmaulHusnaData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<EsmaulHusna> dataList = snapshot.data!;
                return ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      final item = dataList[index];
                      return Column(
                        children: [
                          if (index == 0)
                            BannerAdWidget(
                              bannerAd: viewModel.bannerAd,
                              padding: const EdgeInsets.only(top: 8),
                            ),
                          ContentWidget(
                            type: ContentTypes.esmaulHusnaType(),
                            number: index + 1,
                            titleText: item.text,
                            text3: item.mean,
                            titlePadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                          ),
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  @override
  EsmaulHusnaViewModel viewModelBuilder(BuildContext context) =>
      EsmaulHusnaViewModel();

  @override
  void onViewModelReady(EsmaulHusnaViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
