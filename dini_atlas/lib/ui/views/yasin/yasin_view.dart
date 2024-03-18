import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
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
      appBar: AppBar(
        backgroundColor: const Color(0xfffff1d1),
      ),
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
                verticalSpaceSmall,
                _navigateButton(
                  viewModel: viewModel,
                  name: "Fatiha",
                  page: 1,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Elif Lam Mim",
                  page: 2,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Ayet-el Kürsi",
                  page: 3,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Amenerrasulü",
                  page: 4,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Lev Enzelna",
                  page: 5,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Amme",
                  page: 6,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Tebareke",
                  page: 8,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Secde",
                  page: 11,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Fetih",
                  page: 14,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Vakıa",
                  page: 19,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Cuma",
                  page: 23,
                ),
                _navigateButton(
                  viewModel: viewModel,
                  name: "Yasin",
                  page: 25,
                ),
              ],
            );
          } else {
            return Image.asset("assets/docs/yasin/$i.png");
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
