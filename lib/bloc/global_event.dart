part of 'global_bloc.dart';

@immutable
abstract class GlobalEvent {}

class ChangePeriodEvent extends GlobalEvent {
  final bool isDaily;
  ChangePeriodEvent({required this.isDaily});

  List<Object> get props => [isDaily];
}

class ShowMainScreenEvent extends GlobalEvent {}

class InitStateEvent extends GlobalEvent {}
