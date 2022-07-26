import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

abstract class BaseStateful<S extends StatefulWidget> extends State<S> {
  void baseInitState() {}

  void baseDispose() {}

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      baseInitState();
    });
    super.initState();
  }

  @override
  void dispose() {
    baseDispose();
    super.dispose();
  }
}
