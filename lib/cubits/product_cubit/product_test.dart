import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductTest extends StatelessWidget {
  const ProductTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                '',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff223263),
                ),
              ),
            ),
            Spacer(),
            Image.asset(
              'assets/images/flash_sale/Search.png',
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 27,
            ),
            Image.asset(
              'assets/images/flash_sale/More.png',
              width: 24,
              height: 24,
            )
          ],
        ),
        leading: BackButton(
          color: Color(0xff9098B1),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          builder: (context, snapshot) {
            return SizedBox();
          },
        ),
      ),
    );
  }
}
