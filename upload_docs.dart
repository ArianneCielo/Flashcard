import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:aiskolar_app/app.dart';
import 'package:path/path.dart';

class UploadDocsPage extends StatefulWidget {
  const UploadDocsPage({super.key});

  @override
  State<UploadDocsPage> createState() => _UploadDocsPageState();
}

class _UploadDocsPageState extends State<UploadDocsPage> {
  final List<File> _files = [];

  Future<void> _pick() async {
    final res = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (res == null) return;
    setState(() => _files.addAll(res.paths.map((p) => File(p!))));
  }

  Future<void> _upload() async {
    final uid = supabase.auth.currentUser!.id;
    for (final file in _files) {
      final name = basename(file.path);
      await supabase.storage.from('documents').upload('$uid/$name', file);
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Documents uploaded!')));
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Additional Documents')),
      body: Column(
        children: [
          Expanded(
            child: _files.isEmpty
                ? const Center(child: Text('No files selected'))
                : ListView(
                    children: _files
                        .map((f) => ListTile(
                            title: Text(basename(f.path)),
                            trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    setState(() => _files.remove(f)))))
                        .toList(),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ElevatedButton.icon(
                    onPressed: _pick,
                    icon: const Icon(Icons.attach_file),
                    label: const Text('Add')),
                const Spacer(),
                ElevatedButton(onPressed: _upload, child: const Text('Upload All'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
