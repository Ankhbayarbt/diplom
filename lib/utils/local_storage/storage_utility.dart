import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._instance;
  factory LocalStorage() {
    return _instance;
  }
  LocalStorage._();
  final _storage = GetStorage();

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  // Generic method to read data
  // Clear all data
}
