import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

abstract class BlocBasis<Bloc> {
  BlocBasis() {
    state = BehaviorSubject();
    event = BehaviorSubject();
    initMapper();
  }

  /// EVENT SUBJECT
  /// 
  BehaviorSubject<BlocEvent<Bloc>> get event;
  set event(BehaviorSubject<BlocEvent<Bloc>> event);

  /// STATE SUBJECT
  /// 
  BehaviorSubject<BlocState<Bloc>> get state;
  set state(BehaviorSubject<BlocState<Bloc>> state);

  /// EVENT TO STATE MAPPER
  @protected
  void listener(Stream<BlocState<Bloc>> Function(BlocEvent<Bloc>) mapper) {
    event.switchMap(mapper).listen((s) => state.add(s));
  }

  void initMapper();
  Stream<BlocState<Bloc>> mapper(BlocEvent<Bloc> e);

  /// TO DISPOSE STREAMS
  /// 
  Future<void> dispose(); 
}

abstract class BlocState<Bloc> extends Equatable {
  @override
  List<Object> get props => [];
}

abstract class BlocEvent<Bloc> extends Equatable {
  @override
  List<Object> get props => [];
}