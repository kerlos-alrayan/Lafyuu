import 'package:ecommerce_app_sat26/components/category.dart';
import 'package:ecommerce_app_sat26/screens/account_screen.dart';
import 'package:ecommerce_app_sat26/screens/explore_screen.dart';
import 'package:ecommerce_app_sat26/screens/offer_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 16, top: 16,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Search
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          hintText: 'Search Product',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    // Favorite
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    // Notification
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                width: MediaQuery.of(context).size.width,
                height: 0.5,
                color: Color(0xffEBF0FF),
              ),
              Container(
                // margin: EdgeInsets.only(left: 16, right: 16),
                child: CarouselSlider.builder(
                  itemCount: 5,
                  options: CarouselOptions(
                    height: 206,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    enableInfiniteScroll: true,
                  ),
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/Promotion Image.png',
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 18, 50, 70),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Super Flash Sale',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '50% off',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: (){},
                        child: Text(
                          'More Category',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Color(0xff40BFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Category(),
            ],
          ),
        ),
      ),
    );
  }
}
