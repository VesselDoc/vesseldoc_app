import 'dart:io';
import 'package:path_provider/path_provider.dart';

///Based on: https://flutter.dev/docs/cookbook/persistence/reading-writing-files
class StoreAddressService {
  Future<String> get _localPath async {
    Directory directory = await getTemporaryDirectory(); //Directory.systemTemp.createTemp();
        return directory.path;
      }
    
      Future<File> get _localFile async {
        final path = await _localPath;
        return File('$path/address.txt');
      }
    
      writeAddress(String address) async {
        final file = await _localFile;
        return file.writeAsStringSync(address);
      }
    
      Future<String> readAddress() async {
        try {
          final file = await _localFile;
          return await file.readAsString();
        } catch (e) {
          return '';
        }
      }

}
