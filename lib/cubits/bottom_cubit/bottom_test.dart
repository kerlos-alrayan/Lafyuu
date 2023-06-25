import 'package:ecommerce_app_sat26/cubits/bottom_cubit/bottom_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomTest extends StatefulWidget {
  const BottomTest({super.key});

  @override
  State<BottomTest> createState() => _BottomTestState();
}

class _BottomTestState extends State<BottomTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<BottomCubit, BottomState>(
                builder: (context, state){
                  if(state is BottomInitial){
                    return Text(
                      '0',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.indigo,
                      ),
                    );
                  }
                  if(state is NumberChanged){
                    return Text(
                      '${state.count.toString()}',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.red,
                      ),
                    );
                  }
                  if(state is NumberClear){
                    return Text(
                      '${state.count.toString()}',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.red,
                      ),
                    );
                  }
                  return SizedBox();
                }
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 150)
              ),
              onPressed: () {
                context.read<BottomCubit>().numChanged();
              },
              child: Text('Click'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 150),
                backgroundColor: Colors.red
              ),
              onPressed: () {
                context.read<BottomCubit>().numClear();
              },
              child: Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}
