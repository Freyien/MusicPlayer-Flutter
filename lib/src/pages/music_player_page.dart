import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[

          _Background(),

          Column(
            children: <Widget>[

              CustomAppBar(),

              _ImageDiscDuration(),

              _PlayTitle(),

              Expanded(
                child: _Lyrics()
              )


            ],
          ),
        ],
      )
    );
  }
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            Color(0xff33333E),
            Color(0xff201E28)
          ]
        )
      ),
    );
  }
}

class _Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();

    return Container(
      margin: EdgeInsets.only(top: 15),
      child: ListWheelScrollView(
        itemExtent: 42, 
        diameterRatio: 1.5,
        physics: BouncingScrollPhysics(),
        children: lyrics.map((line) {
          return Text(line, 
            style: TextStyle(
              fontSize: 18, 
              color: Colors.white.withOpacity(0.6)
            )
          );
        }).toList()
      ),
    );
  }
}

class _PlayTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 25),
      child: Row(
        children: <Widget>[

          Column(
            children: <Widget>[

              //Song title
              Text('Far Away', style: TextStyle(fontSize: 30, color: Colors.white.withOpacity(0.8))),

              //Artist
              Text('-Breaking Benjamin-', style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.4)))

            ],
          ),

          Spacer(),

          //Play button
          FloatingActionButton(
            onPressed: (){
              //TODO Action button
            },
            backgroundColor: Color(0xffF8CB51),
            child: Icon(Icons.play_arrow),
            elevation: 0,
            highlightElevation: 0,
          )

        ],
      ),
    );
  }
}

class _ImageDiscDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[

          _ImageDisc(),
          
          Spacer(),

          _DurationBar(),
          

        ],
      ),
    );
  }
}

class _DurationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle( color: Colors.white.withOpacity(0.4) );
    return Container(
      child: Column(
        children: <Widget>[

          Text('00:00', style: textStyle),
          SizedBox(height: 10),

          Stack(
            children: <Widget>[

              Container(
                width: 3,
                height: 230,
                color: Colors.white.withOpacity(0.1),
              ),

              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: 150,
                  color: Colors.white.withOpacity(0.8),
                ),
              )

            ],
          ),

          SizedBox(height: 10),
          Text('00:00', style: textStyle),

        ],
      ),
    );
  }
}

class _ImageDisc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(250),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[

            //Image disc
            Image(image: AssetImage('assets/aurora.jpg')),

            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(25)
              ),
            ),

            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Color(0xff1C1C25),
                borderRadius: BorderRadius.circular(18)
              ),
            ),
          ],
        ),
      ),
      //Border
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(250),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1E1C24)
          ]
        )
      ),
    );
  }
}