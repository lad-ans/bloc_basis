import 'package:flutter/material.dart';
import 'package:bloc_basis/bloc_basis.dart';

class BlocbasisBuilder<Bloc> extends StatelessWidget {

  const BlocbasisBuilder({
    Key? key,
    this.initialState,
    this.defaultChild,
    required this.blocBuilder,
    required this.listenState,
  }) : super(key: key);

  final BlocState<Bloc>? initialState;

  /// Default child to be displayed
  /// 
  final Widget? defaultChild;

  /// BlocBuilder
  /// 
  final Widget Function(BuildContext, BlocState<Bloc>?) blocBuilder;

  /// [BlocState] to be listen
  /// 
  final BehaviorSubject<BlocState<Bloc>> listenState;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocState<Bloc>>(
      initialData: initialState,
      stream: listenState,
      builder: (context, snapshot) {
        if (defaultChild != null) {
          if (snapshot.hasData) {
            return blocBuilder(context, snapshot.data!);
          } else {
            return defaultChild!;
          }
        } else {
          return blocBuilder(context, snapshot.data);
        }
      },
    );
  }
}