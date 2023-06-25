part of 'bottom_cubit.dart';

@immutable
abstract class BottomState {}

class BottomInitial extends BottomState {}

class NumberChanged extends BottomState{
 int count;
 NumberChanged(this.count);
}
class NumberClear extends BottomState{
 int count;
 NumberClear(this.count);
}
