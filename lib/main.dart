import 'package:flutter/material.dart';
import 'screen/selectDistrict.dart';


void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "APP",
      home: FirstScreen() ,
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Sistema de Recompesas por Reciclar",style: TextStyle(color: Colors.white,fontSize: 18.0),),
            SizedBox(height: 30.0,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  shape:  RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.white,
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SelectDistrict()));
                  },
                  child: Text("Continuar"),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}

