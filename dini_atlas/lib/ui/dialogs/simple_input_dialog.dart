import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';

class SimpleInputDialog extends StatelessWidget {
  SimpleInputDialog({
    super.key,
    required this.title,
    this.keyboardType,
    this.hintText,
    this.icon,
    this.onEntry,
  });
  final String title;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? icon;
  final Function(String input)? onEntry;

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: kcBackgroundColor,
      title: Text(title),
      content: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _controller,
                keyboardType: keyboardType ?? TextInputType.text,
                decoration: InputDecoration(
                  hintText: hintText,
                  icon: icon ?? const Icon(Icons.note_add, color: kcGrayColor),
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text("Tamam"),
          onPressed: () {
            Navigator.of(context).pop();
            onEntry?.call(_controller.text);
          },
        ),
      ],
    );
  }
}
