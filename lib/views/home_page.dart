import 'package:Wallpaper/data/data.dart';
import 'package:Wallpaper/model/categories_model.dart';
import 'package:Wallpaper/widgets.dart/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> categories = new List();

  @override
  void initState() {
    //Calling the items in categories list
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              //search bar
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: "earch"),
                    ),
                  ),
                  Icon(
                    Icons.search,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              //categories
              height: 80,

              decoration: BoxDecoration(
                //color: Colors.blue,

                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),

              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoriesTile(
                    title: categories[index].categoriesName,
                    imgUrl: categories[index].imgUrl,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  CategoriesTile({this.imgUrl, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imgUrl),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(title),
          )
        ],
      ),
    );
  }
}
