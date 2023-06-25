import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key,}) : super(key: key);
  final List items = const [
    {
      Icon: Icon(Icons.add_a_photo_outlined, color: Color(0xff40BFFF),),
      'text': 'Man Shirt',
    },
    {
      Icon: Icon(Icons.devices_sharp, color: Color(0xff40BFFF),),
      'text': 'Dress',
    },
    {
      Icon: Icon(Icons.favorite_border_outlined, color: Color(0xff40BFFF),),
      'text': 'Man Work',
    },
    {
      Icon: Icon(Icons.place_outlined, color: Color(0xff40BFFF),),
      'text': 'Woman Bag',
    },
    {
      Icon: Icon(Icons.play_arrow_outlined, color: Color(0xff40BFFF),),
      'text': 'Man Shoes',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 140,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 12, left: 12),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(66),
                        border: Border.all(
                          width: 1,
                          color: Colors.black12,
                        )),
                    width: 70,
                    height: 70,
                    child: items[index][Icon],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.center,
                    // color: Colors.black87,
                    width: 70,
                    // height: 70,

                    child: Text(
                      '${items[index]['text']}',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
