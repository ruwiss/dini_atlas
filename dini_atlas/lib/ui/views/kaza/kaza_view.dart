import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:dini_atlas/ui/views/kaza/widgets/auth_widget.dart';
import 'package:dini_atlas/ui/views/kaza/widgets/table_widget.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:dini_atlas/ui/widgets/banner_ad_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'kaza_viewmodel.dart';

class KazaView extends StackedView<KazaViewModel> {
  const KazaView({super.key});

  @override
  Widget builder(
    BuildContext context,
    KazaViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarWidget(
        title: "Kaza Çetelesi",
        actions: [
          if (!viewModel.isBusy && viewModel.isUserLoggedIn)
            IconButton(
              onPressed: viewModel.saveKazaData,
              icon: const Icon(
                Icons.save,
                color: kcPrimaryColor,
              ),
            )
        ],
      ),
      body: Center(
        child: viewModel.isBusy
            ? const CircularProgressIndicator()
            : !viewModel.isUserLoggedIn
                ? KazaAuthWidget(viewModel: viewModel)
                : viewModel.kaza == null
                    ? const CircularProgressIndicator()
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 24),
                          child: Column(
                            children: [
                              BannerAdWidget(
                                bannerAd: viewModel.bannerAd,
                                padding: const EdgeInsets.only(bottom: 15),
                              ),
                              KazaTableWidget(viewModel: viewModel),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25),
                                child: _lastModificationWidget(
                                    viewModel.kaza?.lastUpdated),
                              ),
                            ],
                          ),
                        ),
                      ),
      ),
    );
  }

  Widget _lastModificationWidget(DateTime? date) {
    if (date == null) return const SizedBox();

    return Column(
      children: [
        const Text(
          "Son Kayıt",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(date.formatDateTimeAsString()),
      ],
    );
  }

  @override
  KazaViewModel viewModelBuilder(BuildContext context) => KazaViewModel();

  @override
  void onViewModelReady(KazaViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }
}
