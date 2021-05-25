import 'package:appathon/SearchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AnkitaFile.dart';
import 'ColorScheme.dart';
import 'package:appathon/WelcomeScreen.dart';

//HERE IS THE PROFILE
class DoctorProfilePatientScreen extends StatelessWidget {
  static final String id = 'doctor_profile';
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoctorProfilePatientPage(),
      routes: {
        'FirstPage': (context)=> WelcomeScreen(),
      },
    );
  }
}
class DoctorProfilePatientPage extends StatefulWidget{
  @override
  _DoctorProfilePatientPage createState() => _DoctorProfilePatientPage();
}
class _DoctorProfilePatientPage extends State<DoctorProfilePatientPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: LinearGradient(
          colors: [Colors.white, Color(0xFF2196F3)],
          begin: Alignment(0, -1.15),
          end: Alignment(0, 0.1),
        ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: _onSearchButtonPressed,
              padding: EdgeInsets.only(top: 30),

            ),
            Expanded(
              flex: 2,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Image.asset('assets/images/1.png'), //<a href='https://www.freepik.com/vectors/people'>People vector created by pch.vector - www.freepik.com</a>
                ),
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height*0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: bgColor,
              ),
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Row(
                          children: <Widget>[
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.asset('assets/images/docPic.png'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('\nDr. Colin', style: GoogleFonts.comfortaa(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),),
                                Text("Heart Surgeon", style: GoogleFonts.comfortaa(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),),
                              ],
                            ),
                          ],

                        ),
                        Padding(
                          padding: EdgeInsets.only(left:8, right:8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("\nAbout", style: GoogleFonts.comfortaa(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),),
                              SizedBox(height: 10,),
                              Text("This will contain a detailed description of the doctor and their specialties", style: GoogleFonts.comfortaa(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                              SizedBox(height: 10,),
                              Text("Available Time Slots",style: GoogleFonts.comfortaa(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ) ),

                              SizedBox(height: 5,),
                              timeSlotWidget("13", "May", "Check-up", "\nSunday from 9 am to 10 am"),
                              timeSlotWidget("14", "May", "Consult", "\nMonday from 10 am to 12 pm"),
                              timeSlotWidget("15", "May", "Consult", "\nThursday from 10 am to 12 pm"),
                              timeSlotWidget("16", "May", "Check-up", "\nFriday from 10 am to 12 pm"),
                              // timeSlotWidget("13", "May", "Consult", "\nSunday from 9 am to 10 am      "),
                              // timeSlotWidget("14", "May", "Consult", "\nMonday from 10 am to 12 pm    "),
                              // timeSlotWidget("15", "May", "Consult", "\nThursday from 10 am to 12 pm "),
                              // timeSlotWidget("16", "May", "Consult", "\nFriday from 10 am to 12 pm       "),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
  Container timeSlotWidget(String date, String month, String type, String time){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: docContentBgColor
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: dateBgColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("$date",style: GoogleFonts.comfortaa(
                    color: Color(0xFF2196F3),
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),),
                  Text("$month", style: GoogleFonts.comfortaa(
                    color: Color(0xFF2196F3),
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("$type", style: GoogleFonts.comfortaa(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),),
                  Text("$time", style: GoogleFonts.comfortaa(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),),
                ],
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Container(
            //     margin: EdgeInsets.all(10),
            //     child: IconButton(
            //       icon: const Icon(Icons.arrow_forward),
            //       onPressed: _onArrowButtonPressed,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  void _onSearchButtonPressed(){
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) => new SearchPage())
    );
  }

}
