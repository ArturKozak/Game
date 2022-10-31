import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class IndexController extends ChangeNotifier {
  static const int nextIndex = 1;
  static const int previousIndex = -1;
  static const int moveIndex = 0;

  late Completer _completer;
  late bool animation;

  int? index;
  int? event;

  Future move(int index, {bool animation = true}) {
    this.animation = animation;

    this.index = index;

    event = moveIndex;

    _completer = Completer();

    notifyListeners();

    return _completer.future;
  }

  Future next({bool animation = true}) {
    event = nextIndex;

    this.animation = animation;

    _completer = Completer();

    notifyListeners();

    return _completer.future;
  }

  Future previous({bool animation = true}) {
    event = previousIndex;

    this.animation = animation;

    _completer = Completer();

    notifyListeners();

    return _completer.future;
  }

  void complete() {
    if (!_completer.isCompleted) {
      _completer.complete();
    }
  }
}
