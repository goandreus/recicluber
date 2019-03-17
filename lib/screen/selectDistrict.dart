import 'package:flutter/material.dart';
import 'package:flutter_ui_login/screen/selectPerson.dart';



class SelectDistrict extends StatefulWidget {
  @override
  _SelectDistrictState createState() => _SelectDistrictState();
}

class _SelectDistrictState extends State<SelectDistrict> {

  List _cities =
  ["San Borja", "Lima", "San Isidro", "San Luis", "Surco"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(city)
      ));
    }
    return items;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("¿Qué distrito vives?",style: TextStyle(color: Colors.white,fontSize: 26.0),),
            SizedBox(height: 30.0,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              ],
            ),
            DropdownButton(
              style: TextStyle(color: Colors.black54,fontSize: 18.0),
              hint: Text('Escoger'),
              value: _currentCity,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
            ),
            SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  shape:  RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.white,
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SelectPerson()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text("Ser parte del Cambio",style: TextStyle(fontSize: 18,color: Colors.green),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }
}

