


import 'package:flutter/widgets.dart';
import 'package:flutter_training/widgets/widget_error_icon.dart';
import 'package:flutter_training/widgets/widget_loading_icon.dart';

class AsyncBuilder extends StatelessWidget {

  final VoidCallback onDataAbsent;
  final AsyncSnapshot data;
  final Widget child;

  Widget errorIcon = ErrorIcon();
  Widget loadingIcon = LoadingIcon();

  AsyncBuilder({
    @required this.data,
    @required this.child,
    @required this.onDataAbsent,

    this.errorIcon,
    this.loadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    if (data.hasData) {
      return child;
    } else if (data.hasError) {
      return errorIcon;
    } else {
      onDataAbsent();

      return loadingIcon;
    }
  }

}