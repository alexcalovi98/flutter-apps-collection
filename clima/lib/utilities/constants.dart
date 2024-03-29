import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kButtonStyle = ButtonStyle(
  foregroundColor: MaterialStatePropertyAll(Colors.white),
  overlayColor: MaterialStatePropertyAll(Colors.white10)
);

const kTextFieldDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      size: 40.0,
      color: Colors.white,
    ),
    hintText: "Enter City Name",
    hintStyle: TextStyle(
        color: Colors.grey
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none
    )
);