import 'package:dini_atlas/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'webview_viewmodel.dart';

class WebviewView extends StackedView<WebviewViewModel> {
  const WebviewView({super.key, required this.title, this.path, this.url});
  final String title;
  final String? path;
  final String? url;

  @override
  Widget builder(
    BuildContext context,
    WebviewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarWidget(title: title),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : WebViewWidget(controller: viewModel.controller),
    );
  }

  @override
  WebviewViewModel viewModelBuilder(BuildContext context) => WebviewViewModel();

  @override
  void onViewModelReady(WebviewViewModel viewModel) {
    viewModel.init(url: url, path: path);
    super.onViewModelReady(viewModel);
  }
}
