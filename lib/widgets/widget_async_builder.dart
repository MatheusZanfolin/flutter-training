
import 'package:flutter/widgets.dart';

class AsyncBuilder extends StatelessWidget {

  final VoidCallback onDataAbsent;
  final AsyncSnapshot data;
  final Widget child;
  final Widget errorIcon;
  final Widget loadingIcon;

  AsyncBuilder({
    @required this.data,
    @required this.child,
    @required this.onDataAbsent,
    @required this.errorIcon,
    @required this.loadingIcon,
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