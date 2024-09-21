import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class BottomNavbarEvent {}

class SelectTabEvent extends BottomNavbarEvent {
  final int index;

  SelectTabEvent(this.index);
}

// States
abstract class BottomNavbarState {}

class TabSelectedState extends BottomNavbarState {
  final int selectedIndex;

  TabSelectedState(this.selectedIndex);
}

// BLoC
class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarState> {
  BottomNavbarBloc() : super(TabSelectedState(0)) {
    on<SelectTabEvent>((event, emit) {
      emit(TabSelectedState(event.index));
    });
  }
}
