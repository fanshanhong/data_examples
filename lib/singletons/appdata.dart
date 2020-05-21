/// 缓存类,用于存储一些数据
class AppData {
  static final AppData _appData = new AppData._internal();

  String text;

  factory AppData() {
    return _appData;
  }

  AppData._internal();
}

final appData = AppData();