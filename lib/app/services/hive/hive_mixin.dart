import 'package:acacia/app/services/hive/hive_constants.dart';
import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:hive/hive.dart';

mixin HiveMixin {
  Future<Box> openUserBox<T>() async {
    return await getHiveBox(HiveConstants.userBox);
  }

  Future<Box> getHiveBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      PrintManager.print(
        "$boxName is already opened",
        color: ConsoleColor.yellow,
      );
      return Hive.box(boxName);
    }
    PrintManager.print("$boxName opened", color: ConsoleColor.yellow);
    return Hive.openBox(boxName);
  }

  Future<T?> getOpenHiveBox<T>({
    required String boxName,
    required String fieldName,
  }) async {
    Box hiveBox = await getHiveBox(boxName);
    T? model = (hiveBox.get(fieldName) as T);

    return model;
  }

  Future<List<T>?> getListOpenHiveBox<T>({
    required String boxName,
    required String fieldName,
  }) async {
    Box hiveBox = await getHiveBox(boxName);
    List<dynamic>? list = hiveBox.get(fieldName); // Hive returns List<dynamic>

    if (list == null) return null;

    // Explicitly cast each element to the expected type
    return list.map((e) => e as T).toList();
  }

  Future<void> putOpenHiveBox<T>({
    required String boxName,
    required String fieldName,
    required T data,
  }) async {
    Box hiveBox = await getHiveBox(boxName);
    hiveBox.put(fieldName, data);
    PrintManager.print(data, color: ConsoleColor.yellow);
  }

  Future<void> deleteHiveBox(String boxName) async {
    // Check if the box file exists
    final boxExists = await Hive.boxExists(boxName);

    if (boxExists) {
      // If the box exists, delete it
      await Hive.deleteBoxFromDisk(boxName);
      PrintManager.print("Box '$boxName' deleted successfully.");
    } else {
      PrintManager.print("Box '$boxName' does not exist.");
    }
  }
}
