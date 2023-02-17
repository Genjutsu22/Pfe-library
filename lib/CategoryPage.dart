import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/Getdata.dart';
import 'dart:convert';

class CategoryPage extends StatefulWidget {
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List ctglist = [];
  Future getCategories() async {
    var url = "https://intertarsal-surface.000webhostapp.com/getCategories.php";
    var res;
    try {
      res = await http.get(Uri.parse(url));
    } catch (e) {
      print(e);
    }

    if (res.statusCode == 200) {
      setState(() {
        var red = json.decode((res.body));
        ctglist.addAll(red);
      });
    }
  }

  List ctgbkslist = [];
  String a = "";
  Future getlistbooks(String a) async {
    var url =
        "https://intertarsal-surface.000webhostapp.com/getCategoriesBooks.php?cat=\"$a\"";
    var res;
    try {
      res = await http.get(Uri.parse(url));
    } catch (e) {
      print(e);
    }

    if (res.statusCode == 200) {
      setState(() {
        var red = json.decode((res.body));
        ctgbkslist.addAll(red);
      });
    }
  }

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Categories",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: [
                    for (int i = 0; i < ctglist.length; i++)
                      InkWell(
                        onTap: () 
                          async {
                            try {
                               var url =
        "https://intertarsal-surface.000webhostapp.com/getCategoriesBooks.php?cat=\"${ctglist[i]["cat_nom"]}\"";
    var res;
    try {
      res = await http.get(Uri.parse(url));
    } catch (e) {
      print(e);
    }

    if (res.statusCode == 200) {
      setState(() {
        var red = json.decode((res.body));
        ctgbkslist.addAll(red);
      });
    
  }
                          Navigator.pushNamed(context, 'bookslistpage',
                              arguments: CategotieBookArguments(
                                  ctgbkslist));
                            } catch (e) {
                              
                            }
   
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "https://intertarsal-surface.000webhostapp.com/library1/admin/bookimg/${ctglist[i]["image_cat"]}",
                                  width: 90,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${ctglist[i]["cat_nom"]}",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 23,
                              )
                            ],
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
      //  bottomNavigationBar: Customnavbar(),
    );
  }
}
