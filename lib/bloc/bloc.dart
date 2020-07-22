
import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class BLoC<T> {

  final _controller = StreamController<T>();

  Stream<T> get stream => _controller.stream;

  @protected
  StreamSink<T> get sink => _controller.sink;

  void dispose() {
    _controller.close();
  }

}