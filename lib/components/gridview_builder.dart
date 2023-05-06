import 'package:flutter/material.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 238, // height of container
          crossAxisCount: 2, // 3dd 2l container 2lly gnb b3d
          mainAxisSpacing: 11, // height between containers
          crossAxisSpacing: 9, // width between containers
        ),
        itemCount: 4,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffE5E5E5)
          ),
          width: 50,
          height: 50,
        ));
  }
}
