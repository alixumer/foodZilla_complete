import 'package:flutter/material.dart';

//our constants values weee will define here
const kPrimaryColor = Color(0xFFd70165);
const kScaffoldColor = Color(0xFFFBFCFC);
const kTextColorDark = Color(0xFF191923);
const kTextColorWhite = Color(0xFFFDFEFE);
const kTextColorLight = Color(0xFF8B8B8D);
const kOutlineInputColor = Color(0xFF1E1E28);

const kDefaultPadding = 20.0;

//conditions for mobile number
const String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

//conditions for email
const String emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
