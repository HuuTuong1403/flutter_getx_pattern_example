import 'package:get/get.dart';

class SplashController extends GetxController {

// final MyRepository repository;
// SplashController(this.repository);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}