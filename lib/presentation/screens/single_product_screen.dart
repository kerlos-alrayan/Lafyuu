// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_sat26/cubits/product_details_cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SingleProductScreen extends StatefulWidget {
  final int id;
  final String name;
  SingleProductScreen({required this.id, required this.name});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  bool isFavorite = false;
  final int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductDetailsCubit>().getProductDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                widget.name,
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
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is LoadingProductState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetProductSuccess) {
            final homeProduct = state.productDetails.data.products[index];
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Line
                  Container(
                    margin: EdgeInsets.only(top: 16, bottom: 16),
                    width: MediaQuery.of(context).size.width,
                    height: 0.5,
                    color: Color(0xffEBF0FF),
                  ),
                  // Carousel Slider
                  CarouselSlider.builder(
                    itemCount: 1,
                    options: CarouselOptions(
                      height: 206,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      enableInfiniteScroll: true,
                    ),
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Image.network(
                        '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Title
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 22, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title And Favorite
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.78,
                              child: Text(
                                homeProduct.name,
                                maxLines: 5,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  color: Color(0xff223263),
                                ),
                              ),
                            ),
                            Spacer(),
                            // Favorite
                            IconButton(
                                onPressed: () {
                                  if (isFavorite) {
                                    setState(() {
                                      isFavorite = false;
                                    });
                                  } else {
                                    setState(() {
                                      isFavorite = true;
                                    });
                                  }
                                },
                                icon: isFavorite
                                    ? Icon(
                                        Icons.favorite,
                                        color: Color(0xffFF001E),
                                      )
                                    : Icon(
                                        Icons.favorite_border_outlined,
                                        color: Color(0xff9098B1),
                                      )),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        // Rating
                        RatingBar.builder(
                          itemSize: 20,
                          ignoreGestures: true,
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        // Price
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 24),
                          child: Text(
                            'EGP ${homeProduct.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              color: Color(0xff40BFFF),
                            ),
                          ),
                        ),
                        // Description
                        Text(
                          homeProduct.description,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Color(0xff9098B1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
