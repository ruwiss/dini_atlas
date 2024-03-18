import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/kaza/kaza_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KazaAuthWidget extends StatefulWidget {
  const KazaAuthWidget({super.key, required this.viewModel});
  final KazaViewModel viewModel;

  @override
  State<KazaAuthWidget> createState() => _KazaAuthWidgetState();
}

class _KazaAuthWidgetState extends State<KazaAuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          SvgPicture.asset(kiAuthEmoji),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 46),
            child: Text(
              "Verilerin kayıt edilebilmesi için giriş yapmanız gereklidir.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          _actionButton(
              text: "E-Mail ile Giriş Yap",
              onPressed: widget.viewModel.authUser),
          if (widget.viewModel.hasError)
            _errorWidget(widget.viewModel.modelError),
          verticalSpace(100),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _errorWidget(String error) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Text(
        error,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Widget _actionButton({
    required VoidCallback? onPressed,
    required String text,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kcBlueGrayColorSoft,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: kcGrayColor,
        ),
      ),
    );
  }
}
