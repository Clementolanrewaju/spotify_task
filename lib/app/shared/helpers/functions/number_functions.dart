import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';


String dateFormat(DateTime format ){
  return DateFormat.y().add_Hm().format(format);
}


