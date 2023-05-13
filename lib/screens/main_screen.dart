import 'package:ecommerce_app_sat26/components/gridview_builder.dart';
import 'package:ecommerce_app_sat26/components/text_more.dart';
import 'package:ecommerce_app_sat26/model/category_repo_model.dart';
import 'package:ecommerce_app_sat26/repository/category_repo.dart';
import 'package:ecommerce_app_sat26/screens/category_screen.dart';
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
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
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
              // Category & More Category
              TextAndMore(
                text: 'Category',
                more: 'More Category',
              ),
              // Categories
              Center(
                child: FutureBuilder<List<CategoryRepoModel>>(
                  future: CategoryRepository().getAllCategories(),
                  builder: (context, snapshot) {
                    final response = snapshot.data;

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data == null) {
                        return Text('This is no data!');
                      }
                      if (response != null) {
                        final listOfCategories = response;
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
                                                  title: listOfCategories[index].name,
                                                  imageURL:
                                                      listOfCategories[index].image,
                                                )));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 12, left: 12),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                listOfCategories[index].image),
                                            radius: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.19,
                                          child: Text(
                                            listOfCategories[index].name,
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
              ),
              // Flash Sale
              TextAndMore(
                text: 'Flash Sale',
                more: 'See More',
              ),
              // GridView Builder
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                child: GridViewBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
