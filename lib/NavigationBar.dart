import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationBar extends StatefulWidget {
  final Function onTap;
  int seletedIndex = 0;

  NavigationBar({@required this.onTap, this.seletedIndex});

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    List<NavigationItem> itemList = [
      new NavigationItem(FontAwesomeIcons.instagram, " INS", Colors.yellow),
      new NavigationItem(
          FontAwesomeIcons.playstation, "  PS", Colors.blueAccent),
      new NavigationItem(FontAwesomeIcons.apple, "Apple", Colors.black),
      new NavigationItem(FontAwesomeIcons.google, "oogle", Colors.greenAccent),
      new NavigationItem(FontAwesomeIcons.amazon, "mazon", Colors.redAccent),
    ];

    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border.all(color: Colors.white, width: 0.5),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(5.0, 5.0),
              blurRadius: 5.0,
              spreadRadius: 5.0),
        ],
      ),
      height: 80,
      width: width,
      padding: EdgeInsets.only(bottom: 18),
      child: Row(
          children: itemList.map((item) {
        int index = itemList.indexOf(item);

        return InkWell(
          onTap: () {
            widget.seletedIndex = index;
            setState(() {
              widget.onTap(index);
            });
          },
          child: createItem(item, widget.seletedIndex == index, width / 6),
        );
      }).toList()),
    );
  }

  Widget createItem(NavigationItem item, bool selected, double width) {
    double itemHeight = width - 0.5;

    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: selected ? itemHeight * 2 : itemHeight,
      height: itemHeight - 20,
      decoration: selected
          ? BoxDecoration(
              color: item.color,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              borderRadius: BorderRadius.all(Radius.circular(itemHeight / 2)),
            )
          : null,
      child: selected ? createItemIconWithName(item) : createItemIcon(item),
    );
  }

  Widget createItemIconWithName(NavigationItem item) {
    return FittedBox(
      fit: BoxFit.none,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconTheme(
              data: IconThemeData(size: 26, color: Colors.white),
              child: Icon(item.icon)),
          Text(
            item.text,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
          )
        ],
      ),
    );
  }

  Widget createItemIcon(NavigationItem item) {
    return Container(
      child: IconTheme(
          data: IconThemeData(size: 26, color: Colors.black),
          child: Icon(item.icon)),
    );
  }
}

class NavigationItem {
  final IconData icon;
  final String text;
  final Color color;

  NavigationItem(this.icon, this.text, this.color);
}
