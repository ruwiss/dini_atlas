import 'package:flutter/material.dart';

class ContentInput extends StatelessWidget {
  const ContentInput(
      {super.key, required this.name, this.metinCtrl, this.kaynakCtrl});
  final String name;
  final TextEditingController? metinCtrl;
  final TextEditingController? kaynakCtrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.blueGrey.withOpacity(.1),
      child: Column(
        children: [
          TextFormField(
            controller: metinCtrl,
            maxLines: 4,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(hintText: name, labelText: name),
          ),
          TextFormField(
            controller: kaynakCtrl,
            style: const TextStyle(fontSize: 14),
            decoration:
                const InputDecoration(hintText: "Kaynak (isteğe bağlı)"),
          ),
        ],
      ),
    );
  }
}
