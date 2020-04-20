import 'package:flutter/material.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[


          CustomAppBar(),

          _ImageDiscDuration()


        ],
      )
    );
  }
}

class _ImageDiscDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
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