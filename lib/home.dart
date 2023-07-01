import 'package:demo2/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:demo2/models/diet_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = []; //diet list

//in order to access he list
  //void _getCategories() {
  // categories = CategoryModel.getCategories();
  //}

  // void_getDiets() {
  //  diets = DietModel.getDiets(); //function of diet list
  //}
//instead of creating  function to get info of each section  we create  function getinitialinfo
  void _getInitialinfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialinfo();
    return Scaffold(
      appBar: appBar(), //to call the appBar  we extract it to method
      backgroundColor: Colors.white,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // to place category at the start n not center
          children: [
            _searchField(),
            SizedBox(
              height: 40,
            ),
            _categoriesSection(),
            SizedBox(
              height: 40,
            ),
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Recommendation ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
//list views
              SizedBox(
                // dist btw text n list box
                height: 15,
              ),
              Container(
                height: 240,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                        width: 210,
                        decoration: BoxDecoration(
                            color: diets[index].boxColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                            //to write inside the box
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(diets[index].iconPath),
                              Column(
                                children: [
                                  Text(
                                    diets[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    diets[index].level +
                                        ' | ' +
                                        diets[index].duration +
                                        ' | ' +
                                        diets[index].strength,
                                    style: const TextStyle(
                                        color: Color(0xff7B6F72),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),

                              //view button
                              Container(
                                height: 45,
                                width: 130,
                                child: Center(
                                  child: Text(
                                    'View',
                                    style: TextStyle(
                                        color: diets[index].viewIsSelected
                                            ? Colors.white
                                            : const Color(0xffC58BF2),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      diets[index].viewIsSelected
                                          ? const Color(0xff9DCEFF)
                                          : Colors.transparent,
                                      diets[index].viewIsSelected
                                          ? const Color(0xff92A3FD)
                                          : Colors.transparent
                                    ]),
                                    borderRadius: BorderRadius.circular(50)),
                              )
                            ]));
                  },
                  shrinkWrap:
                      true, //list will wrap its content n will be as big as the children allows it to be
                  separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ), // seperation btw boxes
                  itemCount: diets.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20, right: 20),
                ),
              )
            ])
          ]),
    );
  }

  //distance from top
  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal, //scroll bar
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, //

                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        //to reduce the
                        padding: const EdgeInsets.all(8.0),

                        child: SvgPicture.asset(categories[index].iconPath),
                        //to display the images in that circle
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container _searchField() {
    //to increase the readablity we extract  the method
    return Container(
      margin: EdgeInsets.only(
          top: 40, left: 20, right: 20), // search bar at a distance
      decoration: BoxDecoration(//to put shadow to the search bar
          boxShadow: [
        BoxShadow(
            color: Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),

      child: TextField(
        //ddecorate the search bar
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            hintText: 'search ',
            hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/search.svg'),
            ),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                //since we r using row there we have to use this widget
                child: Row(
                    //horizontal
                    mainAxisAlignment: MainAxisAlignment.end, //rignt side end
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        indent: 10, //to create space from top
                        endIndent: 10, // to create space from bottom
                        thickness: 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/cancel.svg'),
                      ),
                    ]),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'characters ',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),

      backgroundColor: Colors.white, //background color of app bar
      elevation: 0.0, //remove the shadow of appbar
      centerTitle: true, // text appears at the  center

      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/icons/menu.svg',
              //to change the size of the icon
              height: 20,
              width: 20),
          decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      //to get the same button on right  side
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37, // width of the container
            child: SvgPicture.asset('assets/icons/home.svg',
                //to change the size of the icon
                height: 5,
                width: 5),

            decoration: BoxDecoration(
                color: Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
