import 'package:appathon/SearchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ColorScheme.dart';
import 'WelcomeScreen.dart';
import 'LoginScreen.dart';


//HERE IS THE PROFILE
class PatientProfilePatientScreen extends StatelessWidget {
  static final String id = 'PatientInfo';
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PatientProfilePatientPage(),
      routes: {
        'FirstPage': (context)=> WelcomeScreen(),
      },
    );
  }
}
class PatientProfilePatientPage extends StatefulWidget{
  @override
  _PatientProfilePatientPage createState() => _PatientProfilePatientPage();
}
class _PatientProfilePatientPage extends State<PatientProfilePatientPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: LinearGradient(
          colors: [Color(0xffD5E0FA), Color(0xff3479C0)],
          begin: Alignment(0, -1.15),
          end: Alignment(0, 0.1),
        ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Expanded(
              //flex: 2,
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _onSearchButtonPressed,
                  padding: EdgeInsets.only(top: 30),
                ),
            //),
            Expanded(
              flex: 2,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.all(0),
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
                              child: Image.asset('assets/images/patient_image.png'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('\nAlice', style: GoogleFonts.comfortaa(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),),
                              ],
                            ),
                          ],

                        ),
                        Container(
                          padding: EdgeInsets.only(left:8, right:8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Positioned(
                              //   child: InkWell(
                              //     child: Container(
                              //       height: 60,
                              //       width: MediaQuery.of(context).size.width,
                              //       decoration: BoxDecoration(
                              //         color: getStartedColorEnd,
                              //           borderRadius: BorderRadius.all(
                              //             Radius.circular(10),
                              //           ),
                              //       ),
                              //       child: Center(
                              //         child: Text(
                              //           "Click for health information",
                              //           style: GoogleFonts.comfortaa(
                              //             color: Colors.white,
                              //             fontSize: 20,
                              //             fontWeight: FontWeight.w800,
                              //           ),
                              //         ),
                              //       ),
                              //
                              //     ),
                              //     onTap: openHomePage,
                              //   ),
                              // ),
                              SizedBox(height: 10,),
                              Text("Upcoming Appointments",style: GoogleFonts.comfortaa(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ) ),
                              SizedBox(height: 5,),
                              timeSlotWidget("2", "Apr", "Check-up", "Dr. Bob", "9 am to 10 am"),
                              timeSlotWidget("13", "May", "Check-up", "Dr. Colin", "9 am to 10 am"),
                              // timeSlotWidget("21", "May", "Eating Habits Meeting", "Dr. Ankita", "10 am to 12 pm"),
                              // timeSlotWidget("10", "June", "Check in and Update", "Dr. Ankita", "10 am to 12 pm"),
                              // timeSlotWidget("10", "Aug", "Check-up", "Dr. Bob", "9 am to 10 am"),
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
  void openHomePage()
  {
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) => new LoginScreen())
    );
  }
  Container timeSlotWidget(String date, String month, String type, String doctor, String time){
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
                    color: dateColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),),
                  Text("$month", style: GoogleFonts.comfortaa(
                    color: dateColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("$type", style: GoogleFonts.comfortaa(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),),
                Text("$doctor", style: GoogleFonts.comfortaa(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),),
                Text("$time", style: GoogleFonts.comfortaa(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),),
              ],
            )
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
