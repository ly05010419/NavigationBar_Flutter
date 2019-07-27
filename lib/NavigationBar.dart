import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int seletedIndex = 2;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    List<NavigationItem> itemList = [
      new NavigationItem(FontAwesomeIcons.instagram, " INS", Colors.yellow),
      new NavigationItem(FontAwesomeIcons.playstation, "  PS", Colors.blueAccent),
      new NavigationItem(FontAwesomeIcons.apple, "Apple", Colors.black),
      new NavigationItem(FontAwesomeIcons.google, "oogle", Colors.greenAccent),
      new NavigationItem(FontAwesomeIcons.amazon, "mazon", Colors.redAccent),
    ];

    return Container(
      height: 80,
      width: width,
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 18,left: 10,right: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: itemList.map((item) {
            int index = itemList.indexOf(item);

            return GestureDetector(
              onTap: () {
                seletedIndex = index;
                setState(() {

                });
              },
              child: createItem(item, seletedIndex == index),
            );
          }).toList()),
    );
  }

  Widget createItem(NavigationItem item, bool selected) {
    double itemHeight = 50;

    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      width: selected ? itemHeight * 2.5 : itemHeight,
      height: itemHeight,
      decoration: selected
          ? BoxDecoration(
        color: item.color,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        borderRadius: BorderRadius.all(Radius.circular(itemHeight / 2)),
      )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          selected
              ? IconTheme(
              data: IconThemeData(size: 26, color: Colors.white),
              child: Icon(item.icon))
              : IconTheme(
              data: IconThemeData(size: 26), child: Icon(item.icon)),
          selected
              ? Text(
            item.text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18),
          )
              : Container()
        ],
      ),
    );
  }
}

class NavigationItem {
  final IconData icon;
  final String text;
  final Color color;

  NavigationItem(this.icon, this.text, this.color);
}
