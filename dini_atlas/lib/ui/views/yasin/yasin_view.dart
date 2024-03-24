import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:page_flip/page_flip.dart';
import 'yasin_viewmodel.dart';

class YasinView extends StackedView<YasinViewModel> {
  const YasinView({super.key});

  @override
  Widget builder(
    BuildContext context,
    YasinViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const AppBarWidget(title: "", backgroundColor: Color(0xfffff1d1)),
      backgroundColor: const Color(0xfffff1d1),
      body: PageFlipWidget(
        key: viewModel.controller,
        backgroundColor: const Color(0xfffff1d1),
        lastPage: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(kiLogo, width: 100),
              Text(
                "Dini Atlas",
                style: TextStyle(
                  fontSize: 24,
                  color: kcPrimaryColorDark.withOpacity(.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        children: List.generate(31, (i) {
          if (i == 0) {
            return ListView(
              children: [
                verticalSpaceMedium,
                _navigateButton(
                  viewModel: viewModel,
                  name: "Yasin",
                  page: 1,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Fatiha",
                  page: 7,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Elif Lam Mim",
                  page: 8,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Ayet-el Kürsi",
                  page: 9,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Amenerrasulü",
                  page: 10,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Lev Enzelna",
                  page: 11,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Amme",
                  page: 12,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Tebareke",
                  page: 14,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Secde",
                  page: 17,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Fetih",
                  page: 20,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Vakıa",
                  page: 25,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Cuma",
                  page: 29,
                ),
                verticalSpaceLarge,
              ],
            );
          } else {
            return Image.asset("assets/docs/yasin/$i.webp");
          }
        }),
      ),
    );
  }

  Widget _navigateButton(
      {required YasinViewModel viewModel,
      required String name,
      required int page}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: TextButton(
        onPressed: () => viewModel.goToPage(page),
        style:
            TextButton.styleFrom(backgroundColor: kcGrayColor.withOpacity(.1)),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: kcPrimaryColorDark.withOpacity(.7),
          ),
        ),
      ),
    );
  }

  @override
  YasinViewModel viewModelBuilder(BuildContext context) => YasinViewModel();

  @override
  void onViewModelReady(YasinViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
