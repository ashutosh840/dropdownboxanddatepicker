import 'package:flutter/material.dart';
import 'Type.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:enum_to_string/camel_case_to_words.dart';
import 'dart:async';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: dropDown(),
          ),
        ),
      ),
    );
  }
}

class dropDown extends StatefulWidget {
  @override
  _dropDownState createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {
  @override
  var items=["SNACKS","ENTERTAINMENT","OTHERS","STATIONARY"];
  var currentValue="SNACKS";
  Type type;
  DateTime pickeddate;
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DropdownButton<String>(
         items: items.map((String DropDownItem) {
           return DropdownMenuItem<String>(
             value: DropDownItem,
             child: Text(DropDownItem),

           );
         }).toList(),

          onChanged: (String newValue){
           setState(() {
             currentValue=newValue;
             type=EnumToString.fromString(Type.values, currentValue);
           });
          },
          value: currentValue,
        ),
        Text(
         type.toString()
        ),
        IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: (() async{

            DateTime date=await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year-10),
                lastDate: DateTime(DateTime.now().year+10));
            


            if(date!=null){
              setState(() {
                pickeddate=date;
              });
            }
            

          }),
    ),
        Text(pickeddate.toString())
      ],
    );
  }
}

