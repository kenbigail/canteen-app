import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;

  double get deviceWidth => MediaQuery.of(this).size.width;
}

extension NavigatorExt on BuildContext {
  void pop<T extends Object>([T? result]) {
    Navigator.pop(this, result);
  }
// Menutup halaman saat ini
// context.pop();
// context.pop<int>(42); // Mengembalikan angka ke halaman sblmnya

  void popToRoot<T extends Object>() {
    Navigator.popUntil(this, (route) => route.isFirst);
  }
// Kembali ke halaman root dari aplikasi
// context.popToRoot();

  Future<T?> push<T extends Object>(Widget widget, [String? name]) async {
    return Navigator.push<T>(
      this,
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: name),
      ),
    );
  }
// Navigasi ke halaman detail produk
// context.push(DetailPage(productId: 123), 'DetailPage');
// Navigasi ke halaman pengaturan tanpa memberi nama rute
// context.push(SettingsPage());

  Future<T?> pushReplacement<T extends Object, TO extends Object>(
      Widget widget) async {
    return Navigator.pushReplacement<T, TO>(
      this,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object>(
      Widget widget, bool Function(Route<dynamic> route) predicate) async {
    return Navigator.pushAndRemoveUntil<T>(
      this,
      MaterialPageRoute(builder: (context) => widget),
      predicate,
    );
  }
// Menavigasi ke halaman home tetapi menjaga halaman pertama tetap ada, hapus semua kasih false aja
// context.pushAndRemoveUntil(HomePage(), (route) => route.isFirst);
}
