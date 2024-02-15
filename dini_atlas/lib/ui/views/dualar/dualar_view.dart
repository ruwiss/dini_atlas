import 'package:dini_atlas/models/content_type.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:dini_atlas/ui/widgets/content_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dualar_viewmodel.dart';

class DualarView extends StackedView<DualarViewModel> {
  const DualarView({super.key});

  @override
  Widget builder(
    BuildContext context,
    DualarViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const AppBarWidget(title: "Günlük Duâlar"),
      body: Center(
          child: viewModel.isBusy
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: FutureBuilder(
                    future: viewModel.getDailyPrayers(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}",
                            textAlign: TextAlign.center);
                      } else if (snapshot.hasData) {
                        final List items = snapshot.data!;
                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final String item = items[index];
                            return ContentWidget(
                              number: index + 1,
                              type: ContentTypes.dualarType(),
                              text3: item,
                              isSaved: viewModel.isInFavourites(item),
                              onBookmarkTap: () =>
                                  viewModel.toggleFavorite(item, index + 1),
                            );
                          },
                        );
                      }
                      return const Text("Yükleniyor");
                    },
                  ),
                )),
    );
  }

  @override
  DualarViewModel viewModelBuilder(BuildContext context) => DualarViewModel();

  @override
  void onViewModelReady(DualarViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
