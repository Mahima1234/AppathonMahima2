import 'package:appathon/DoctorProfilePatientScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ColorScheme.dart';
import 'LoginScreen.dart';
class WelcomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      routes: {
        'LoginScreen': (context)=> LoginScreen(),
      },
    );
  }
}
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePage createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(
                    painter: pathPainter(),
                  ),
                ),
              Container(
                padding: EdgeInsets.all(50),
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Healera", style: GoogleFonts.comfortaa(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),),
                    Text("Click the button to get started", style: GoogleFonts.comfortaa(
                      fontSize: 18.5,
                      fontWeight: FontWeight.w500,
                    ),),
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height*0.3,
                child: Container(
                  width:MediaQuery.of(context).size.width,
                  child: Center(
                    child: Image.asset('assets/images/imgtransparent.png'), //<a href='https://www.freepik.com/vectors/car'>Car vector created by pch.vector - www.freepik.com</a>
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  child: Container(
                    height: 80,
                    width: 200,
                    decoration: BoxDecoration(

                      gradient: LinearGradient(
                        stops: [0,1],
                        colors: [Colors.white, path1Color],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                      )
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.comfortaa(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  onTap: openHomePage,
                ),
              ),
              ],
          ),
        ],
      ),
    );

  }
  void openHomePage()
  {
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) => new LoginScreen())
    );
  }
}
class pathPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    //paint.color = getStartedColorStart;
    paint.color = Colors.pink;


    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height*0.4);
    path.quadraticBezierTo(size.width*0.35, size.height*0.4, size.width*0.58, size.height*0.6);
    path.quadraticBezierTo(size.width*0.72, size.height*0.8, size.width*0.92, size.height*0.8);
    path.quadraticBezierTo(size.width*0.98, size.height*0.8, size.width, size.height*0.82);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;

  }

}