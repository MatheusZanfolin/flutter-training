
import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class BLoC<T> {

  final _controller = StreamController<T>();

  Stream<T> get stream => _controller.stream;

  @protected
  StreamSink<T> get sink => _controller.sink;

  void dispose() => _controller.close();

}

class BlocProvider<T extends BLoC> extends StatefulWidget {

  final Widget child;
  final T bloc;

  const BlocProvider({Key key, @required this.bloc, @required this.child}) : super(key: key);

  static T of<T extends BLoC>(BuildContext context) {
    return context.findAncestorWidgetOfExactType<BlocProvider<T>>().bloc;
  }

  @override
  State createState() => _BlocProviderState();
  
}

class _BlocProviderState extends State<BlocProvider> {

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

}