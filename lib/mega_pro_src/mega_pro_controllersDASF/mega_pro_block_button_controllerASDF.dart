import 'package:flutter/material.dart';

class ASDFBlockButtonASDF extends ValueNotifier<bool> {
  ASDFBlockButtonASDF(super.value);

  void changeBlock(bool value) {
    this.value = value;
    notifyListeners();
  }
}

abstract class Provider {
  static final block = ASDFBlockButtonASDF(false);
}
