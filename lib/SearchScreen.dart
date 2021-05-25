import 'package:appathon/PatientProfilePatientScreen.dart';
import 'package:appathon/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'CalendarScreen.dart';
import 'ColorScheme.dart';
import 'DoctorProfilePatientScreen.dart';
import 'package:google_fonts/google_fonts.dart';
class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
      routes: {
        'DoctorsInfoPatient' : (context)=>DoctorProfilePatientScreen(),
      },
    );
  }
}
class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width/5,
            decoration: BoxDecoration(
                color: docContentBgColor
            ),
            child: IconButton(
              icon: const Icon(Icons.map),
              onPressed: map, //change this to what is left
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width/5,
            decoration: BoxDecoration(
                color: docContentBgColor
            ),
            child: IconButton(
              icon: const Icon(Icons.crop_square_sharp),
              onPressed: forms,
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width/5,
            decoration: BoxDecoration(
                color: docContentBgColor
            ),
            child: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: calendar,
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width/5,
            decoration: BoxDecoration(
                color: docContentBgColor
            ),
            child: IconButton(
              icon: const Icon(Icons.chat_bubble_outline_outlined),
              onPressed: chat,
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width/5,
            decoration: BoxDecoration(
                color: docContentBgColor
            ),
            child: IconButton(
              icon: const Icon(Icons.account_circle_outlined),
              onPressed: profile,
            ),
          ),
        ],

      ),
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  // leading: Icon(
                  //   Icons.menu,
                  //   color: Colors.black,
                  //   size: 30,
                  // ),
                  actions: <Widget>[
                    // Container(
                    //   height: 75,
                    //   width: 75,
                    //   decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       gradient: LinearGradient(
                    //           colors: [getStartedColorStart, getStartedColorEnd],
                    //           stops: [0,1]
                    //       )
                    //   ),
                    //   child: Center(
                    //     child: Text("C", style: GoogleFonts.comfortaa(
                    //       color: Colors.white,
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //     ),),
                    //   ),
                    // )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14, right: 10, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Select a Doctor", style: GoogleFonts.comfortaa(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Doctors", style: GoogleFonts.comfortaa(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),),
                      SizedBox(height: 20,),
                      Container(
                        height: 470,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              createDocWidget("docPic.png", "Colin", "Heart Surgeon"),
                              createDocWidget("docPic.png", "Ankita", "General Physician"),
                              createDocWidget("docPic.png", "Richa", "General Physician"),
                              createDocWidget("docPic.png", "Bob", "Heart Surgeon"),
                              createDocWidget("docPic.png", "Vinamra", "General Physician"),
                              createDocWidget("docPic.png", "Mahima", "General Physician"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Container categoryContainer(String imgName, String title)
  {
    return Container(
      width: 130,
      child: Column(
        children: <Widget>[
          // Image.asset('assets/images/category/$imgName'),
          Text(
            "$title", style: GoogleFonts.comfortaa(
              fontWeight: FontWeight.w800,
              fontSize: 17
          ),
          )
        ],
      ),
    );
  }
  Container createDocWidget(String imgName, String docName, String docType)
  {
    return Container(
      child: InkWell(
        child: Container(

          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: docContentBgColor,
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/$imgName'),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Dr. $docName", style: GoogleFonts.comfortaa(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),),
                    SizedBox(height: 5,),
                    Container(
                      width: 200,
                      height: 50,
                      child: Text("$docType", style: GoogleFonts.comfortaa(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: openDocInfo,
      ),
    );
  }
  void openDocInfo()
  {
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) => new DoctorProfilePatientScreen())
    );
  }

  void profile(){
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) => new PatientProfilePatientScreen())
    );
  }

  void chat(){
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) => new FirstScreen())
    );
  }

  void calendar(){
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) => new CalendarScreen())
    );
  }

  void forms() {
    Navigator.push(context, new MaterialPageRoute(
      //replace with the search page
        builder: (context) => new PatientProfilePatientScreen())
    );
  }


  void map(){
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) => new PatientProfilePatientScreen())
    );
  }
}
