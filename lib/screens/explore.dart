import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:techlanguages/themes/color.dart';
import 'package:techlanguages/utils/data.dart';
import 'package:techlanguages/widgets/category_item.dart';

class explore_page extends StatefulWidget {
  const explore_page({Key? key}) : super(key: key);

  @override
  State<explore_page> createState() => _explore_pageState();
}

class _explore_pageState extends State<explore_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBgColor,
            pinned: true,
            title: getAppBar(),
          ),
          SliverToBoxAdapter(
            child: getsearchbox(),
          ),
          SliverToBoxAdapter(
            child: getCatgories(),
          ),
        ],
      ),
    );
  }

  getAppBar() {
    return Container(
      child: Row(
        children: [
          Text(
            "Explore",
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w600, fontSize: 24),
          )
        ],
      ),
    );
  }

  getsearchbox() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: shadowColor.withOpacity(0.05),
                        spreadRadius: .5,
                        blurRadius: .5,
                        offset: Offset(0, 0))
                  ]),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    hintText: 'Search'),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: primary, borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset('assets/icons/filter.svg',
                color: Colors.white),
          )
        ],
      ),
    );
  }

  getCatgories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15, top: 10, bottom: 5),
      child: Row(
          children: List.generate(
              categories.length,
              (index) => category_item(
                    isActive: index == 0,
                    data: categories[index],
                  ))),
    );
  }
}