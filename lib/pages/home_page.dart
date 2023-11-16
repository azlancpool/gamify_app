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
      body: Stack(children: <Widget>[
        _featuredGamesWidget(),
        _gradientBoxWidget(),
        ],)
      );
  }

  Widget _featuredGamesWidget(){
    return SizedBox(
      height: _deviceHeight * 0.5,
      width: _deviceWidth,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: featuredGames.map((e) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(e.coverImage.url)
              )
            )
          );
        }).toList(),
      ),
    );
  }

  Widget _gradientBoxWidget(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight * 0.8,
        width: _deviceWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(35, 45, 59, 1.0),
              Colors.transparent,
            ],
            stops:  [0.65, 1.0],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )
        ),
      )
    );
  }
}