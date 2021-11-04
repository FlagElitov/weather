import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(ArrowDownState());
  bool down = false;

  @override
  Stream<CardState> mapEventToState(
    CardEvent event,
  ) async* {
    if (event is ToggleArrowEvent) {
      this.down = !this.down;
      yield this.down ? ArrowDownState() : ArrowDownState();
    }
  }
}
