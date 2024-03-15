import 'package:dini_atlas_panel/extensions/datetime_extensions.dart';
import 'package:dini_atlas_panel/services/ftp_service.dart';
import 'package:dini_atlas_panel/ui/views/editor/editor_view.dart';
import 'package:dini_atlas_panel/ui/views/media/media_view.dart';
import 'package:flutter/material.dart';
import 'package:ftpconnect/ftpconnect.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        helpText: "Tarih Seç",
        confirmText: "Oluştur",
        cancelText: "İptal",
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 30)));
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dini Atlas Panel", style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.blueGrey.shade50,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MediaView(viewer: true)));
              },
              icon: const Icon(Icons.image),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<FTPEntry>>(
          future: FTPService.instance.listDailyJsonFiles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              final List<FTPEntry> data = snapshot.data!;
              return Column(
                children: [
                  ListTile(
                    title: const Text("Yeni Oluştur"),
                    onTap: () async {
                      final datetime = await _selectDate(context);
                      if (datetime != null && context.mounted) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (context) => EditorView(
                                    fileName:
                                        "${datetime.formatDateTimeString()}.json",
                                    isNew: true)))
                            .then((_) => setState(() {}));
                      }
                    },
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final FTPEntry item = data[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(
                            "Oluşturuldu: ${item.modifyTime?.formatDateTimeAsString()}",
                            style: const TextStyle(fontSize: 12),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) =>
                                        EditorView(fileName: item.name)))
                                .then((_) => setState(() {}));
                          },
                          trailing: IconButton(
                            onPressed: () async {
                              await FTPService.instance.removeJson(item.name);
                              setState(() {});
                            },
                            icon: const Icon(Icons.close),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
