import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final _storage = GetStorage();
  final RxBool _isFirstTime = true.obs;
  final RxBool _isLoggedIn = false.obs;
  bool get isFirstTime => _isFirstTime.value;
  bool get isLoggedIn => _isLoggedIn.value;
  @override
  void onInit() {
    super.onInit();
    _loadinitialState();
  }

  void _loadinitialState() {
    _isFirstTime.value = _storage.read('sFirstTime') ?? true;
    _isLoggedIn.value = _storage.read('isLoggedIn') ?? false;
  }

  void setFirstTimeDone() {}
  void login() {}
  void logout() {}
}
