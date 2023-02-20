import 'package:firebase_storage/firebase_storage.dart';
import 'package:test_firebase_app/domain/FileStorage.dart';

class DownloadFiles{
  Future<List<String>?>? download() async {
    final List<String> list = [];
    final storage = FirebaseStorage.instance.ref('image');
    final listResult = await storage.listAll();
    // for (var item in listResult.items){
    //   final fileStorage = FileStorage(url: item.getDownloadURL().toString(), name: item.name);
    // }
    for (var item in listResult.items){
      list.add(item.name);
    }
    return list;
  }

  Future<List<FileStorage>> download2() async{
    final List<FileStorage> list = [];
    final storage = FirebaseStorage.instance.ref('image');
    final listResult = await storage.listAll();
    for (var item in listResult.items){
      final fileStorage =  FileStorage(url: await item.getDownloadURL(), name: item.name);
      list.add(fileStorage);
    }
    return list;
  }
}