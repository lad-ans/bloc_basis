import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

abstract class BlocBasis<Bloc> {
  BlocBasis() {
    state = BehaviorSubject();
    event = BehaviorSubject();

    mapEventToState();
  }

  /// Event Subject
  /// 
  BehaviorSubject<BlocEvent<Bloc>> get event;
  set event(BehaviorSubject<BlocEvent<Bloc>> event);

  /// State Subject
  /// 
  BehaviorSubject<BlocState<Bloc>> get state;
  set state(BehaviorSubject<BlocState<Bloc>> state);

  /// Map event to a bloc state
  void mapEventToState();

  /// To dispose as created subjects
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