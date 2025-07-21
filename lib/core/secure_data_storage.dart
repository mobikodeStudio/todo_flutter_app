import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Create storage
final storage = FlutterSecureStorage();


Future<String?> readData(String key)async{
  return  await storage.read(key: key);
}
Future<Map<String, String>> readAllData(String key)async{
  return  await storage.readAll();
}
void deleteData(String key)async{
  return  await storage.delete(key: key);
}
void deleteAllData()async{
  return  await storage.deleteAll();
}
void insetData(String key, String value)async{
  return  await storage.write(key: key, value: value);
}

