part of 'global_bloc.dart';

@immutable
abstract class GlobalEvent {}

class ShowSplashScreenEvent extends GlobalEvent {}

class ShowMainScreenEvent extends GlobalEvent {}
class InitStateEvent extends GlobalEvent {}

