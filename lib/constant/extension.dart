import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

// extension DateExtension on DateTime {
//   String? getOnlyDate(String pattern) {
//     try {
//       return DateFormat(pattern).format(this);
//     } catch (e) {
//       return null;
//     }
//   }
// }
// extension NumberParsing on String {
//   int parseInt() {
//     return int.parse(this);
//   }
//
//   double parseDouble() {
//     return double.parse(this);
//   }
// }

extension DateTimeExtensions on DateTime {

  DateTime withTime([int hour = 0, int minute = 0]) =>
      DateTime(this.year, this.month, this.day, hour, minute);

}

extension SizeBoxExtensions on num {

  SizedBox get sbh => SizedBox(height: toDouble());

  SizedBox get sbw => SizedBox(width: toDouble());
}

class DateTimeFormatter{

  static String yyyy_MM_dd = "yyyy-MM-dd";
  static String SERVER_DATE_TIME = "yyyy-MM-dd HH:mm:ss";
  static String dd_MM_yyyy_hh_mm_AM_PM = "dd-MM-yyyy hh:mm a";
  static String yyyy_MM_dd_hh_mm_ss = "yyyy-MM-dd hh:mm:ss";
  static String yyyy_MM_dd_hh_mm_AM_PM = "yyyy-MM-dd hh:mm a";
  static String DD_MM_YYYY = "dd MMM yyyy";
  static String dd_MMM_yyy_hh_mm_a = "dd MMM yyyy hh:mm a";
  static String MM_HH = "hh:mm aaa";
  static String MMMM = "MMMM";


  static DateTime getDateTimeObjectFromUtc(String value,String pattern){
    try{
      return DateFormat(pattern).parse(value,true).toLocal();
    }catch(e){
      return DateTime.now();
    }
  }

  static DateTime getDateObjectFromUtc(String value,String pattern){
    try{
      return DateFormat(pattern).parse(value,true).toLocal();
    }catch(e){
      return DateTime.now();
    }
  }

  static DateTime getDateTimeObject(String value){
    try{
      return DateFormat(SERVER_DATE_TIME).parse(value);
    }catch(e){
      return DateTime.now();
    }
  }
  static int getCurrentUTCTimestamp(){
    try{
      return DateTime.now().toUtc().millisecondsSinceEpoch;
    }catch(e){
      return 0;
    }
  }

  static String getFirstDayOfMonth(){
    try{
      final now = DateTime.now();
      return "${now.year}-${now.month}-01";
    }catch(e){
      return "";
    }
  }
  static String getLastDayOfMonth(){
    try{
      final now = DateTime.now();
      final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
      return DateFormat(yyyy_MM_dd).format(DateFormat(yyyy_MM_dd_hh_mm_ss).parse(lastDayOfMonth.toString()));
    }catch(e){
      return "";
    }
  }
  static String getTodayDate(){
    try{
      return DateFormat(yyyy_MM_dd).format(DateFormat(yyyy_MM_dd_hh_mm_ss).parse(DateTime.now().toString()));
    }catch(e){
      return "";
    }
  }
  static String getDateTime(String value, String pattern){
    try{
      return DateFormat(pattern).format(DateFormat(yyyy_MM_dd_hh_mm_ss).parse(value));
    }catch(e){
      return "";
    }
  }
  static String getDateTimeFromServerFormat(String value, String pattern){
    try{
      return DateFormat(pattern).format(DateFormat(SERVER_DATE_TIME).parse(value));
    }catch(e){
      return "";
    }
  }

  static String getDateTimeFromUtc(String value, String pattern){
    try{
      return DateFormat(pattern).format(DateFormat(yyyy_MM_dd_hh_mm_ss).parse(value,true).toLocal());
    }catch(e){
      return "";
    }
  }


  static String getUTCDateTimeFromLocal(String value,String currentPattern, String convertPattern){
    try{
      return DateFormat(convertPattern).format(DateFormat(currentPattern).parse(value).toUtc());
    }catch(e){
      return "";
    }
  }

  static String getDateTimeFromDate(DateTime value, String pattern){
    try{
      return DateFormat(pattern).format(value);
    }catch(e){
      return "";
    }
  }
  static String getEndDateTime(DateTime value, String pattern){
    try{
      return DateFormat(pattern).format(value.toUtc());
    }catch(e){
      return "";
    }
  }
  static String getDateFromTimestamp(int timeMillisecond, String pattern){
    try{
      return DateFormat(pattern).format(DateTime.fromMillisecondsSinceEpoch(timeMillisecond).toUtc());
    }catch(e){
      return "";
    }
  }

  static bool isFutureDateThenToday(String date){
    if(date.isEmpty) {
      return false ;
    }
    DateTime passDate = DateFormat(yyyy_MM_dd_hh_mm_ss).parse(date,true);
    DateTime todayDate = DateFormat(yyyy_MM_dd_hh_mm_ss).parse(DateTime.now().toString());

    return passDate.compareTo(todayDate) > 0;
  }
}