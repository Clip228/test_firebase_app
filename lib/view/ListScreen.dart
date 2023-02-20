import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase_app/data/download.dart';
import 'package:test_firebase_app/domain/FileStorage.dart';
import 'package:test_firebase_app/theme/theme.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<FileStorage?>? _listNameStorage = [];
  List<String?>? _listUrlStorage = [];

  @override
  void initState() {
    loadFilesList();
    super.initState();
  }

  Future<void> upload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.first.path!);
      String fileName = result.files.first.name;

      // Upload file
      await FirebaseStorage.instance.ref('image/$fileName').putFile(file);
      _listNameStorage = await DownloadFiles().download2();
      setState(() {});
    }
  }

  void loadFilesList() async {
    _listNameStorage = await DownloadFiles().download2();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Storage',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
        leading: const Icon(
          Icons.cloud,
          color: Colors.white,
        ),
      ),
      body: Column(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Expanded(
              child: ListView.separated(
                  key: Key(_listNameStorage!.length.toString()),
                  separatorBuilder: (context, i) => const Divider(),
                  itemCount: _listNameStorage!.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(
                        _listNameStorage![i]!.name,
                        style: const TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/detail', arguments: _listNameStorage![i]!.url);
                      },
                      trailing: const Icon(Icons.arrow_forward_ios),
                    );
                  })),
          Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () async {
                  upload();
                  _listNameStorage = await DownloadFiles().download2();
                  setState(() {});
                },
                backgroundColor: Colors.greenAccent,
                child: const Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }
}

