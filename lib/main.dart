import 'package:appathon/DoctorProfilePatientScreen.dart';
import 'package:appathon/PatientProfilePatientScreen.dart';
import 'package:appathon/SearchScreen.dart';
import 'package:appathon/screens/first_screen.dart';
import 'package:appathon/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.cyan,
  ),
  home: SearchScreen(), //CHANGE THIS TO SEE THE DIFFERENT PAGES
));

class MyApp extends
 StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: DoctorProfilePatientScreen(),
    );
  }
}

