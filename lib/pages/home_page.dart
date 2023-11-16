import "package:flutter/material.dart";
import "package:gamify_app/data.dart";

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double _deviceHeight = 0;
  double _deviceWidth = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(children: <Widget>[_featuredgamesWidget()],)
      );
  }

  Widget _featuredgamesWidget(){
    return SizedBox(
      height: _deviceHeight * 0.5,
      width: _deviceWidth,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: featuredGames.map((_game) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(_game.coverImage.url)
              )
            )
          );
        }).toList(),
      ),
    );
  }
}