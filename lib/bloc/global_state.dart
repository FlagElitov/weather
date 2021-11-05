part of 'global_bloc.dart';

@immutable
abstract class GlobalState {}

class InitState extends GlobalState {}
class MainScreenState extends GlobalState {}
class IsLoadingState extends GlobalState {}

