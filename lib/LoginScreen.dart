// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:appathon/server_demo_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;
import 'DoctorProfilePatientScreen.dart';

String atSign;

class LoginScreen extends StatefulWidget {
  static final String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  ServerDemoService _serverDemoService = ServerDemoService.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        //child: Center(
        //child: ListView(
        child: Column(
          children: <Widget>[
            Container(
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:AssetImage('assets/images/loginimage.png')
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: DropdownButton<String>(
                        hint: Text('\tPick an @sign'),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        iconSize: 20,
                        elevation: 16,
                        style:
                        GoogleFonts.comfortaa(fontSize: 20.0, color: Colors.black87),
                        onChanged: (String newValue) {
                          setState(() {
                            atSign = newValue;
                          });
                        },
                        value: atSign != null ? atSign : null,
                        items: at_demo_data.allAtsigns
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(20),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(142, 148, 251, .6),
                          ],
                            //colors:[getStartedColorStart, getStartedColorEnd],

                        ),
                      ),
                      child: FlatButton(
                        child: Text('Login', style: GoogleFonts.comfortaa(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),),
                        textColor: Colors.white,
                        onPressed: _login,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  // TODO: Write _login method
  /// Use onboard() to authenticate via PKAM public/private keys.
  _login() async {
    FocusScope.of(context).unfocus();
    setState(() {
      showSpinner = true;
    });

    String jsonData = _serverDemoService.encryptKeyPairs(atSign);
    if (atSign != null) {
      _serverDemoService.onboard(atsign: atSign).then((value) async {
        Navigator.pushReplacementNamed(context, DoctorProfilePatientScreen.id);
      }).catchError((error) async {
        await _serverDemoService.authenticate(atSign,
            jsonData: jsonData, decryptKey: at_demo_data.aesKeyMap[atSign]);
        Navigator.pushReplacementNamed(context, DoctorProfilePatientScreen.id);
      });
    }
  }
}
