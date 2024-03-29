import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/Customnavbar.dart';
import 'package:myapp/Newwidget.dart';
import 'package:myapp/RecommendedWidget.dart';

bool like = false;
String a = "", b = "";

class BookPage extends StatefulWidget {
  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  Widget build(BuildContext context) {
    dynamic book = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      // bottomNavigationBar: Customnavbar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Opacity(
              child: Image.network(
                book.image,
                height: 340,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              opacity: 0.4,
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          Like(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 85,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(192, 52, 49, 55)
                                      .withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                book.image,
                                height: 250,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Category    Actor    Pages",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          /*RatingBar.builder(
                              itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                              direction: Axis.horizontal,
                              itemSize: 25,
                              allowHalfRating: true,
                              itemCount: 5,
                              unratedColor: Colors.white,
                              initialRating: 3,
                              minRating: 1,
                              updateOnDrag: false),*/
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Description Description Description Description Description Description Description Description Description Description Description Description Description Description",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Color.fromARGB(192, 129, 58, 192),
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add_outlined,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Réserver",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Like extends StatefulWidget {
  const Like({super.key});

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: like == false
          ? Icon(
              Icons.favorite_border,
              size: 35,
              color: Colors.white,
            )
          : Icon(
              Icons.favorite,
              size: 35,
              color: Colors.red,
            ),
      onTap: (() {
        setState(() {
          like = !like;
        });
      }),
    );
  }
}
