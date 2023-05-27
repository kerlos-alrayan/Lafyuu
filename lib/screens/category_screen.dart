import 'package:dio/dio.dart';
import 'package:ecommerce_app_sat26/model/product_category_model.dart';
import 'package:ecommerce_app_sat26/repository/category_repo.dart';
import 'package:ecommerce_app_sat26/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CategoryScreen extends StatelessWidget {
  final String title;
  final String imageURL;
  final int id;

  const CategoryScreen({
    required this.title,
    required this.imageURL,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xff223263),
          ),
        ),
        leading: BackButton(
          color: Color(0xff9098B1),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: FutureBuilder<Response>(
              future: CategoryDetails().getCategoriesDetails(id),
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
                    final listOfProducts = productResponse.data['data']['data'];

                    return Container(
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 282, // height of container
                            crossAxisCount: 2, // 3dd 2l container 2lly gnb b3d
                            mainAxisSpacing: 12, // height between containers
                            crossAxisSpacing: 13, // width between containers
                          ),
                          itemCount: listOfProducts.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                    name: listOfProducts[index]['name'],
                                    imageURL: listOfProducts[index]['image'],
                                    description: listOfProducts[index]
                                        ['description'],
                                    id: listOfProducts[index]['id'],
                                    imagesURL: listOfProducts[index]['images'],
                                    price: listOfProducts[index]['price'],
                                  ),
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
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
                                        listOfProducts[index]['image'],
                                        width: 133,
                                        height: 133,
                                      )),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      // Title
                                      Text(
                                        listOfProducts[index]['name'],
                                        overflow: TextOverflow.ellipsis,
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
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
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
                                            'EGP ${listOfProducts[index]['old_price']}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10,
                                              fontFamily: 'Poppins',
                                              color: Color(0xff9098B1),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            '${listOfProducts[index]['discount']}% off',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10,
                                              fontFamily: 'Poppins',
                                              color: Color(0xffFB7181),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                }
                return Container();
              }),
        ),
      ),
    );
  }
}
// child: FutureBuilder<Response>(
//   future: CategoryDetails().getCategoriesDetails(id),
//   builder: (BuildContext context, snapshot) {
//     final response = snapshot.data!.data['data']['data'];
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return CircularProgressIndicator();
//     }
//     if (snapshot.connectionState == ConnectionState.done) {
//       if (snapshot.data == null) {
//         return Text('This is no data!');
//       }
//       if (response != null) {
//         return GridView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               mainAxisExtent: 320, // height of container
//               crossAxisCount: 2, // 3dd 2l container 2lly gnb b3d
//               mainAxisSpacing: 12, // height between containers
//               crossAxisSpacing: 13, // width between containers
//             ),
//             itemCount: response.length,
//             itemBuilder: (context, index) => Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border(
//                       left: BorderSide(
//                         width: 1,
//                         color: Color(0xffEBF0FF),
//                       ),
//                       right: BorderSide(
//                         width: 1,
//                         color: Color(0xffEBF0FF),
//                       ),
//                       bottom: BorderSide(
//                         width: 1,
//                         color: Color(0xffEBF0FF),
//                       ),
//                       top: BorderSide(
//                         width: 1,
//                         color: Color(0xffEBF0FF),
//                       ),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Center(
//                             child: Image.network(
//                           response[index]['image'],
//                           width: 133,
//                           height: 133,
//                         )),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         // Title
//                         Text(
//                           response[index]['name'],
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 12,
//                             fontFamily: 'Poppins',
//                             color: Color(0xff223263),
//                           ),
//                         ),
//                         Spacer(),
//                         // Price
//                         Text(
//                           '\$${response[index]['price'].toString()}',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 12,
//                             fontFamily: 'Poppins',
//                             color: Color(0xff40BFFF),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 4,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               '\$${response[index]['old_price'].toString()}',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 10,
//                                 fontFamily: 'Poppins',
//                                 color: Color(0xff9098B1),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 8,
//                             ),
//                             Text(
//                               '\$${response[index]['discount'].toString()}% off',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 10,
//                                 fontFamily: 'Poppins',
//                                 color: Color(0xffFB7181),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ));
//       }
//     }
//
//     return Container();
//   },
// ),
