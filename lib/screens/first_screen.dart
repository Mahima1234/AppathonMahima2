import 'dart:ui';
import 'package:appathon/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../service/client_sdk_service.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;


class FirstScreen extends StatefulWidget {
  static final String id = 'first';
  @override
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  bool showSpinner = false;
  String atSign;
  ClientSdkService clientSdkService = ClientSdkService.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2196F3),
        title: Text(
          'Login',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                height: 220,
                width: 180,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/atsign.png',
                            height: 50.0,
                            width: 50.0,
                          ),
                        ),
                        title: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0
                          ),
                        ),
                        subtitle: DropdownButton<String>(
                          hint:  Text('\tPick an @sign'),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black87
                          ),
                          underline: Container(
                            height: 2,
                            color: Color(0xFF2196F3),
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              atSign = newValue;
                            });
                          },
                          value: atSign != null ? atSign
                            : null,
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
                        child: FlatButton(
                          child: Text('Login'),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: _login,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 280,
              ),
              Container(
                height: 50,
                child: FittedBox(
                  child: Image.asset(
                    'assets/images/@logo.png',
                  ),
                ),
              )
            ],
          ),
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
    if (atSign != null) {
      String jsonData = clientSdkService.encryptKeyPairs(atSign);
      clientSdkService.onboard(atsign: atSign).then((value) async {
        Navigator.pushReplacementNamed(context, SecondScreen.id);
      }).catchError((error) async {
        await clientSdkService.authenticate(atSign,
            jsonData: jsonData, decryptKey: at_demo_data.aesKeyMap[atSign]);
        Navigator.pushReplacementNamed(context, SecondScreen.id);
      });
    }
  }
}
