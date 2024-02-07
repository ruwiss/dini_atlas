import 'package:flutter/material.dart';

class SizeProviderWidget extends StatefulWidget {
  final Widget child;
  final Function(Size) onChildSize;

  const SizeProviderWidget(
      {super.key, required this.onChildSize, required this.child});
  @override
  SizeProviderWidgetState createState() => SizeProviderWidgetState();
}

class SizeProviderWidgetState extends State<SizeProviderWidget> {
  @override
  void initState() {
    _onResize();
    super.initState();
  }

  void _onResize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.size is Size) {
        widget.onChildSize(context.size!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
