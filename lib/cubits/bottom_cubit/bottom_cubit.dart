import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_state.dart';

class BottomCubit extends Cubit<BottomState> {
  BottomCubit() : super(BottomInitial());

  int count = 0;
 void numChanged(){
   count++;
   emit(NumberChanged(count));
 }
 void numClear(){
   count = 0;
   emit(NumberClear(count));
 }
}