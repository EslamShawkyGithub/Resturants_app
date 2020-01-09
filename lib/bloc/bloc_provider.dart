import 'package:flutter/material.dart';
import 'bloc_interface.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key key,@required this.child,@required this.bloc }):super(key:key);

  // to get a reference to the generic type
  static Type _providerType<T>() => T;

  /* method allows widgets to retrieve the BlocProvider
   from a descendant in the widget tree with the current build context */
  // inject bloc with widget
  static T of<T extends Bloc>(BuildContext context) {
    final type = _providerType<BlocProvider<T>>();
    // ignore: deprecated_member_use
    final BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  @override
  _BlocProviderState createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
