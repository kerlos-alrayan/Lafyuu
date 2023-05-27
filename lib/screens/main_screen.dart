import 'package:dio/dio.dart';
import 'package:ecommerce_app_sat26/components/text_more.dart';
import 'package:ecommerce_app_sat26/repository/category_repo.dart';
import 'package:ecommerce_app_sat26/screens/category_screen.dart';
import 'package:ecommerce_app_sat26/screens/flash_sale_screen.dart';
import 'package:ecommerce_app_sat26/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // Main
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search & Favorite
              Container(
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Search
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
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
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/main_screen/Vector_main.png',
                        width: 22,
                        height: 22,
                      ),
                    ),
                    // Notification
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/main_screen/Group.png',
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ],
                ),
              ),
              // Line
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                width: MediaQuery.of(context).size.width,
                height: 0.5,
                color: Color(0xffEBF0FF),
              ),
              // CarouselSlider
              FutureBuilder<Response>(
                  future: Home().getHomeData(),
                  builder: (context, snapshot) {
                    final productResponse = snapshot.data;

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data == null) {
                        return Text('This is no data!');
                      }

                      if (productResponse != null) {
                        final listOfData =
                            productResponse.data['data']['banners'];
                        return Container(
                          child: CarouselSlider.builder(
                            itemCount: listOfData.length,
                            options: CarouselOptions(
                              height: 206,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 5),
                              enableInfiniteScroll: true,
                            ),
                            itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => FlashSaleScreen(image: listOfData[itemIndex]['image'],)));
                                  },
                                  child: Container(
                              margin: EdgeInsets.only(left: 16, right: 16),
                              child: Stack(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              listOfData[itemIndex]['image'] ??
                                                  'https://student.valuxapps.com/storage/uploads/banners/1680055803aDUjo.36.PNG',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // child: Image.network(
                                        //   listOfData[itemIndex]['image'] ??
                                        //       'https://student.valuxapps.com/storage/uploads/banners/1680055803aDUjo.36.PNG',
                                        //   fit: BoxFit.cover,
                                        //   // loadingBuilder: (_, __, ___) {
                                        //   //   return Center(
                                        //   //     child: CircularProgressIndicator(),
                                        //   //   );
                                        //   // },
                                        //   errorBuilder: (_, __, ___) {
                                        //     print(
                                        //         'GUBA :: there is an error ${___.toString()}');
                                        //     return Container(
                                        //       height: 206,
                                        //       child: Image.asset(
                                        //           'assets/images/main_screen/image 51.png'),
                                        //     );
                                        //   },
                                        // ),
                                      ),
                                    ),
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //     image: DecorationImage(
                                    //       image: NetworkImage(
                                    //         listOfData[itemIndex]['image'] ?? 'https://student.valuxapps.com/storage/uploads/banners/1680055803aDUjo.36.PNG',
                                    //       )
                                    //     )
                                    //   ),
                                    // )
                                    // Image.network(
                                    //   // errorBuilder:
                                    //   //     (BuildContext, Object, StackTrace) {
                                    //   //   if (snapshot.data!.data['data']
                                    //   //           ['banners']['image'] ==
                                    //   //       null) {
                                    //   //     return Container(
                                    //   //       height: 206,
                                    //   //       child: Image.asset(
                                    //   //           'assets/images/main_screen/image 51.png'),
                                    //   //     );
                                    //   //   }
                                    //   //   return Container(
                                    //   //
                                    //   //   );
                                    //   // },
                                    //   listOfData[itemIndex]['image'],
                                    //   fit: BoxFit.cover,
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.fromLTRB(
                                    //       24, 18, 50, 70),
                                    //   child: Column(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       Text(
                                    //         'Super Flash Sale',
                                    //         style: TextStyle(
                                    //           fontSize: 22,
                                    //           fontFamily: 'Poppins',
                                    //           fontWeight: FontWeight.w700,
                                    //           color: Colors.white,
                                    //         ),
                                    //       ),
                                    //       Text(
                                    //         '50% off',
                                    //         style: TextStyle(
                                    //           fontSize: 24,
                                    //           fontFamily: 'Poppins',
                                    //           fontWeight: FontWeight.w700,
                                    //           color: Colors.white,
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                              ),
                            ),
                                ),
                          ),
                        );
                      }
                    }
                    return Container();
                  }),
              // Category & More Category
              TextAndMore(
                text: 'Category',
                more: 'More Category',
                onTap: () {},
              ),
              // Categories
              FutureBuilder<Response>(
                future: CategoryRepository().getAllCategories(),
                builder: (context, snapshot) {
                  final response = snapshot.data;

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data == null) {
                      return Text('This is no data!');
                    }
                    if (response != null) {
                      final listOfCategories = response.data['data']['data'];
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: listOfCategories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryScreen(
                                                title: listOfCategories[index]
                                                    ['name'],
                                                imageURL:
                                                    listOfCategories[index]
                                                        ['image'],
                                                id: listOfCategories[index]
                                                    ['id'],
                                              )));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 12, left: 12),
                                  child: Column(
                                    children: [
                                      // Image
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16),
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              listOfCategories[index]
                                                  ['image']),
                                          radius: 30,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      // Name
                                      Container(
                                        alignment: Alignment.center,
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.19,
                                        child: Text(
                                          listOfCategories[index]['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.027,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                  }
                  return Container();
                },
              ),
              // Flash Sale
              TextAndMore(
                text: 'Flash Sale',
                more: 'See More',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FlashSaleScreen()));
                },
              ),
              // Flash Sale Products
              Container(
                margin: EdgeInsets.only(top: 12, left: 16),
                child: FutureBuilder<Response>(
                    future: Products().getProduct(),
                    builder: (context, snapshot) {
                      final productResponse = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data == null) {
                          return Text('This is no data!');
                        }
                        if (productResponse != null) {
                          final listOfProducts =
                              productResponse.data['data']['data'];

                          return Container(
                            height: 238,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: listOfProducts.length,
                                itemBuilder: (context, indexItem) =>
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => ProductScreen(
                                            name: listOfProducts[indexItem]
                                                ['name'],
                                            imageURL: listOfProducts[indexItem]
                                                ['image'],
                                            description:
                                                listOfProducts[indexItem]
                                                    ['description'],
                                            id: listOfProducts[indexItem]['id'],
                                            imagesURL: listOfProducts[indexItem]
                                                ['images'],
                                            price: listOfProducts[indexItem]
                                                ['price'],
                                          ),
                                        ));
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Container(
                                          width: 141,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              width: 1,
                                              color: Color(0xffEBF0FF),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                    child: Image.network(
                                                  listOfProducts[indexItem]
                                                      ['image'],
                                                  width: 109,
                                                  height: 109,
                                                )),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                // Title
                                                Text(
                                                  listOfProducts[indexItem]
                                                      ['name'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xff223263),
                                                  ),
                                                ),
                                                Spacer(),
                                                // Price
                                                Text(
                                                  'EGP ${listOfProducts[indexItem]['price']}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xff40BFFF),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'EGP ${listOfProducts[indexItem]['old_price']}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10,
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xff9098B1),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      '${listOfProducts[indexItem]['discount']}% off',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10,
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xffFB7181),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                          );
                        }
                      }
                      return Container();
                    }),
              ),
              // Mega Sale
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: TextAndMore(
                  text: 'Mega Sale',
                  more: 'See More',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FlashSaleScreen()));
                  },
                ),
              ),
              // Flash Sale Products
              Container(
                margin: EdgeInsets.only(top: 12, left: 16),
                child: FutureBuilder<Response>(
                    future: Products().getProduct(),
                    builder: (context, snapshot) {
                      final productResponse = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data == null) {
                          return Text('This is no data!');
                        }
                        if (productResponse != null) {
                          final listOfProducts =
                              productResponse.data['data']['data'];

                          return Container(
                            height: 238,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: listOfProducts.length,
                                itemBuilder: (context, indexItem) =>
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => ProductScreen(
                                            name: listOfProducts[indexItem]
                                                ['name'],
                                            imageURL: listOfProducts[indexItem]
                                                ['image'],
                                            description:
                                                listOfProducts[indexItem]
                                                    ['description'],
                                            id: listOfProducts[indexItem]['id'],
                                            imagesURL: listOfProducts[indexItem]
                                                ['images'],
                                            price: listOfProducts[indexItem]
                                                ['price'],
                                          ),
                                        ));
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Container(
                                          width: 141,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              width: 1,
                                              color: Color(0xffEBF0FF),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                    child: Image.network(
                                                  listOfProducts[indexItem]
                                                      ['image'],
                                                  width: 109,
                                                  height: 109,
                                                )),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                // Title
                                                Text(
                                                  listOfProducts[indexItem]
                                                      ['name'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xff223263),
                                                  ),
                                                ),
                                                Spacer(),
                                                // Price
                                                Text(
                                                  'EGP ${listOfProducts[indexItem]['price']}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xff40BFFF),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'EGP ${listOfProducts[indexItem]['old_price']}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10,
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xff9098B1),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      '${listOfProducts[indexItem]['discount']}% off',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10,
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xffFB7181),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                          );
                        }
                      }
                      return Container();
                    }),
              ),
              // Recomended Product
              Container(
                margin: EdgeInsets.only(top: 9, left: 16, right: 16),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/main_screen/image 51.png',
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48, left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recomended \n Product',
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              'We recommend the best for you',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // GridView Builder
              SingleChildScrollView(
                child: FutureBuilder<Response>(
                    future: Products().getProduct(),
                    builder: (context, snapshot) {
                      final productResponse = snapshot.data;

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data == null) {
                          return Text('This is no data!');
                        }
                        if (productResponse != null) {
                          final listOfProducts =
                              productResponse.data['data']['data'];

                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 282, // height of container
                                    crossAxisCount:
                                        2, // 3dd 2l container 2lly gnb b3d
                                    mainAxisSpacing:
                                        12, // height between containers
                                    crossAxisSpacing:
                                        13, // width between containers
                                  ),
                                  itemCount: listOfProducts.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => ProductScreen(
                                              name: listOfProducts[index]
                                                  ['name'],
                                              imageURL: listOfProducts[index]
                                                  ['image'],
                                              description: listOfProducts[index]
                                                  ['description'],
                                              id: listOfProducts[index]['id'],
                                              imagesURL: listOfProducts[index]
                                                  ['images'],
                                              price: listOfProducts[index]
                                                  ['price'],
                                            ),
                                          ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              width: 1,
                                              color: Color(0xffEBF0FF),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Image
                                                Center(
                                                    child: Image.network(
                                                  listOfProducts[index]
                                                      ['image'],
                                                  width: 133,
                                                  height: 133,
                                                )),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                // Title
                                                Text(
                                                  listOfProducts[index]['name'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xff223263),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                // Rating
                                                RatingBar.builder(
                                                  itemSize: 10,
                                                  ignoreGestures: true,
                                                  initialRating: 4,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 4.0),
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                                Spacer(),
                                                // Price
                                                Text(
                                                  'EGP ${listOfProducts[index]['price']}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xff40BFFF),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'EGP ${listOfProducts[index]['old_price'].toString()}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10,
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xff9098B1),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      '${listOfProducts[index]['discount']}% off',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10,
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xffFB7181),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                            ),
                          );
                        }
                      }
                      return Container();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// GestureDetector(
//   onTap: () {
//     Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => FlashSaleScreen()));
//   },
//   child: Container(
//     // margin: EdgeInsets.only(left: 16, right: 16),
//     child: CarouselSlider.builder(
//       itemCount: 5,
//       options: CarouselOptions(
//         height: 206,
//         autoPlay: true,
//         autoPlayInterval: Duration(seconds: 5),
//         enableInfiniteScroll: true,
//       ),
//       itemBuilder: (BuildContext context, int itemIndex,
//               int pageViewIndex) =>
//           Container(
//         margin: EdgeInsets.only(left: 16, right: 16),
//         child: Stack(
//           children: [
//             Image.asset(
//               'assets/images/Promotion Image.png',
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 18, 50, 70),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Super Flash Sale',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     '50% off',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   ),
// ),
