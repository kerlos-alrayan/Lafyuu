import 'package:flutter/material.dart';

class TextAndMore extends StatelessWidget {
  const TextAndMore({Key? key, this.text, this.more}) : super(key: key);
  final String? text;
  final String? more;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$text',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
              fontSize: MediaQuery.of(context).size.width * 0.038,
              color: Colors.black,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: (){},
            child: Text(
              '$more',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                fontSize: MediaQuery.of(context).size.width * 0.038,
                color: Color(0xff40BFFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
