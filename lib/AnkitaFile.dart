import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colorscheme.dart';



//HERE IS THE PROFILE
class PatientInfo extends StatelessWidget {
  static final String id = 'patient_profile';
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: patientInfoPage(),
    );
  }
}
class patientInfoPage extends StatefulWidget{
  @override
  _patientInfoPage createState() => _patientInfoPage();
}
class _patientInfoPage extends State<patientInfoPage>{
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
              // onPressed: _onSearchButtonPressed,
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
                                Text('\nAvailable Doctors', style: TextStyle(
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
                              Positioned(
                                child: InkWell(
                                  child: Container(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: getStartedColorEnd,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Date Scheduled: 4/2/2021",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),

                                  ),
                                  // onTap: openHomePage,
                                ),
                              ),
                              // IconButton(
                              //   icon: const Icon(Icons.check_box),
                              //   // onPressed: _onSearchButtonPressed,
                              //   padding: EdgeInsets.only(top: 30),
                              // ),
                              SizedBox(height: 10,),
                              Text("Upcoming Appointments",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ) ),
                              SizedBox(height: 5,),
                              timeSlotWidget("Open","May", "General Checkup", "Dr. Bob", "Specializes in pediatric medicine/general health"),
                              timeSlotWidget("Open", "May", "Orthopedic Checkup", "Dr. Ankita", "Specializes in knee and spine-related issues      "),
                              timeSlotWidget("Open", "June", "Dermatologist Special Appointment", "Dr. Richa", "Specializes in severe rashes"),
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
  // void openHomePage()
  // {
  //   Navigator.push(context, new MaterialPageRoute(
  //       builder: (context) => new LoginScreen())
  //   );
  // }
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
                  Text("$date",style: TextStyle(
                    color: dateColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),),
                  // Text("$month", style: TextStyle(
                  //   color: dateColor,
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.w800,
                  // ),),
                  IconButton(
                    icon: const Icon(Icons.check_box),
                    // onPressed: _onSearchButtonPressed,
                    padding: EdgeInsets.only(top: 10),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("$type", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),),
                Text("$doctor", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),),
                Text("$time", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),),
              ],
            ),
            // Container(
            // width: 35,
            // height: 35,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            //   color: dateBgColor,
            IconButton(
              padding: EdgeInsets.only(left: 160),
              icon: const Icon(Icons.arrow_forward),
              // onPressed: _onSearchButtonPressed,

            ),
            // ),
          ],
        ),
      ),
    );
  }

// void _onSearchButtonPressed(){
//   Navigator.push(context, new MaterialPageRoute(
//       builder: (context) => new LoginScreen())
//   );
// }

}