import "package:flutter/material.dart";
import "package:gamify_app/data.dart";
import "package:gamify_app/pages/widgets/scrollable_games_widget.dart";

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double _deviceHeight = 0;
  double _deviceWidth = 0;
  var _selectedGame;

  @override
  void initState() {
    super.initState();
    _selectedGame = 0;
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(children: <Widget>[
        _featuredGamesWidget(),
        _gradientBoxWidget(),
        _topLayerWidget(),
        ],)
      );
  }

  Widget _featuredGamesWidget(){
    return SizedBox(
      height: _deviceHeight * 0.5,
      width: _deviceWidth,
      child: PageView(
        scrollDirection: Axis.horizontal,
        onPageChanged: (_index) {
          setState(() {
          _selectedGame = _index;
          });
        },
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
  
  Widget _topLayerWidget(){
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _deviceWidth * 0.05,
        vertical: _deviceHeight * 0.005,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _topBarWidget(),
          SizedBox(height: _deviceHeight * 0.13),
          _featuredGamesInfoWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: _deviceHeight * 0.01,
            ),
            child:ScrollableGamesWidget(
              _deviceHeight * 0.24,
              _deviceWidth,
              true,
              games,
            ),
          ),
          _featuredGamebannerWidget(),
          ScrollableGamesWidget(
              _deviceHeight * 0.22,
              _deviceWidth,
              false,
              games2,
            )
        ],
      ),
    );
  }

  Widget _topBarWidget(){
    return SizedBox(
      height: _deviceHeight * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Row(
            children: <Widget>[
              const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: _deviceWidth * 0.03,
              ),
              const Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _featuredGamesInfoWidget() {
    return SizedBox(
      height: _deviceHeight * 0.12,
      width: _deviceWidth,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            featuredGames[_selectedGame].title,
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: _deviceHeight * 0.035,
            ),
          ),
          SizedBox(height: _deviceHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: featuredGames.map((e) {
              var isActive = e.title == featuredGames[_selectedGame].title;
              var circleRadius = _deviceHeight * 0.004;
              return Container(
                margin: EdgeInsets.only(right: _deviceWidth * 0.015),
                height: circleRadius * 2,
                width: circleRadius * 2,
                decoration: BoxDecoration(
                  color: isActive ? Colors.green: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
  
  Widget _featuredGamebannerWidget() {
    return Container(
      height: _deviceHeight * 0.13,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image:  DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            featuredGames[3].coverImage.url,
          )
        ),
      ),
    );
  }
}