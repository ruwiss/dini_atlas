import 'package:dini_atlas_panel/extensions/datetime_extensions.dart';
import 'package:dini_atlas_panel/services/ftp_service.dart';
import 'package:dini_atlas_panel/ui/views/editor/editor_view.dart';
import 'package:flutter/material.dart';
import 'package:ftpconnect/ftpconnect.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: !FTPService.instance.connected
            ? const Center(child: Text("FTP Bağlantı Sorunu"))
            : FutureBuilder<List<FTPEntry>>(
                future: FTPService.instance.listDailyJsonFiles(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    final List<FTPEntry> data = snapshot.data!;
                    return ListView.separated(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final FTPEntry item = data[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(
                            "Son düzenleme: ${item.modifyTime?.formatDateTimeAsString()}",
                            style: const TextStyle(fontSize: 12),
                          ),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditorView(fileName: item.name),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    );
                  }
                },
              ),
      ),
    );
  }
}
