import 'package:dini_atlas/models/content_type.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:dini_atlas/ui/widgets/content_widget.dart';
import 'package:dini_atlas/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'riyazus_salihin_viewmodel.dart';

class RiyazusSalihinView extends StackedView<RiyazusSalihinViewModel> {
  const RiyazusSalihinView({super.key});

  @override
  Widget builder(
    BuildContext context,
    RiyazusSalihinViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const AppBarWidget(title: "Riyâzu's Sâlihîn"),
      body: Center(
        child: viewModel.isBusy
            ? const Text("Yükleniyor")
            : viewModel.hasError
                ? Text("${viewModel.modelError}", textAlign: TextAlign.center)
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        verticalSpaceSmall,
                        _searchWidget(viewModel),
                        verticalSpaceSmall,
                        if (viewModel.filterMode)
                          _cancelFilterButton(viewModel),
                        _contentWidget(viewModel)
                      ],
                    ),
                  ),
      ),
    );
  }

  Padding _cancelFilterButton(RiyazusSalihinViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: viewModel.cancelFilter,
            icon: const Icon(Icons.arrow_back),
            label: const Text("Geri Dön"),
          ),
          const Text("Arama sonuçları"),
        ],
      ),
    );
  }

  Widget _contentWidget(RiyazusSalihinViewModel viewModel) {
    final items = viewModel.riyazusSalihinList;
    return items.isEmpty
        ? const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              "Hiçbir arama sonucu bulunamadı.",
              textAlign: TextAlign.center,
            ),
          )
        : Flexible(
            child: NotificationListener<ScrollNotification>(
              onNotification: (info) {
                if (info.metrics.pixels == info.metrics.maxScrollExtent) {
                  viewModel.getRiyazusSalihinList(loadMore: true);
                }
                return true;
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final String title = item.title.contains(": ")
                      ? item.title.split(": ")[1]
                      : "";
                  return Column(
                    children: [
                      ContentWidget(
                        type: ContentTypes.hadithType(),
                        titleText: title,
                        number: item.id,
                        text1: item.arabic,
                        text3: item.turkish,
                        onBookmarkTap: () => viewModel.toggleFavorite(item),
                        isSaved: viewModel.isInFavourites(item.id),
                      ),
                      // Yeni içerikler için yükleme indikatörü
                      if (viewModel.busy(viewModel.currentOffset) &&
                          index == viewModel.currentOffset - 1)
                        const Padding(
                          padding: paddingTiny,
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  );
                },
              ),
            ),
          );
  }

  final EdgeInsetsGeometry _searchFieldPadding =
      const EdgeInsets.symmetric(horizontal: 15, vertical: 7);

  Widget _searchWidget(RiyazusSalihinViewModel viewModel) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: InputField(
            padding: _searchFieldPadding,
            hintText: "Birşeyler yaz",
            onSubmit: (value) {
              if (value.isNotEmpty) {
                viewModel.getRiyazusSalihinList(filter: value);
              }
            },
          ),
        ),
        horizontalSpaceSmall,
        Flexible(
          child: InputField(
            padding: _searchFieldPadding,
            hintText: "Hadis id",
            keyboardType: const TextInputType.numberWithOptions(
              signed: false,
              decimal: false,
            ),
            onSubmit: (value) {
              if (value.isNotEmpty) {
                viewModel.getRiyazusSalihinList(id: int.parse(value));
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  RiyazusSalihinViewModel viewModelBuilder(BuildContext context) =>
      RiyazusSalihinViewModel();

  @override
  void onViewModelReady(RiyazusSalihinViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
