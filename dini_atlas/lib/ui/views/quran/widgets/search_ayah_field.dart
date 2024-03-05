import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/quran/quran_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchAyahField extends StatelessWidget {
  SearchAyahField({super.key, required this.viewModel});
  final QuranViewModel viewModel;

  final _hashInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: kcBlueGrayColor.withOpacity(.95),
      ),
      child: Row(
        children: [
          const Expanded(child: Text("Gitmek istenilen")),
          Flexible(
            child: TextField(
              controller: _hashInputController,
              autofocus: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.end,
              decoration: const InputDecoration(
                hintText: "Ayet No",
                border: InputBorder.none,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSubmitted: viewModel.onHashInputSubmit,
              textInputAction: TextInputAction.search,
            ),
          ),
        ],
      ),
    );
  }
}
