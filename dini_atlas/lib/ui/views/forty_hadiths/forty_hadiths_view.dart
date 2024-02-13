import 'package:dini_atlas/models/content_type.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:dini_atlas/ui/widgets/content_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'forty_hadiths_viewmodel.dart';

class FortyHadithsView extends StackedView<FortyHadithsViewModel> {
  const FortyHadithsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    FortyHadithsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const AppBarWidget(title: "40 Hadis"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: FutureBuilder<List<HadithModel>>(
            future: viewModel.getFortyHadiths(),
            builder: (context, snapshot) {
              if (snapshot.hasData && !viewModel.isBusy) {
                final List<HadithModel> hadiths = snapshot.data!;
                return ListView.builder(
                  itemCount: hadiths.length,
                  itemBuilder: (context, i) {
                    final HadithModel hadith = hadiths[i];
                    return ContentWidget(
                      type: ContentTypes.hadithType(),
                      number: hadith.id,
                      text1: hadith.arabic,
                      text3: hadith.turkish,
                      onBookmarkTap: () =>
                          viewModel.toggleFavorite(hadith),
                      isSaved: viewModel.isInFavourites(hadith.id),
                    );
                  },
                );
              }
              return const Text("Yükleniyor");
            },
          ),
        ),
      ),
    );
  }

  @override
  FortyHadithsViewModel viewModelBuilder(BuildContext context) =>
      FortyHadithsViewModel();

  @override
  void onViewModelReady(FortyHadithsViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
