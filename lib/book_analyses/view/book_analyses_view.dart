import 'package:flutter/material.dart';

class BookAnalysesView extends StatefulWidget {
  const BookAnalysesView({Key? key}) : super(key: key);

  @override
  State<BookAnalysesView> createState() => _BookAnalysesViewState();
}

class _BookAnalysesViewState extends State<BookAnalysesView> {
  int _indexDay = -1;

  int _indexTime = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: listPatient.length,
        separatorBuilder: (context, index) => const Divider(
          color: dividerColor,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) => _itemPatient(index),
      ),
    );
  }

  Widget _itemPatient(int index) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (index != 0) const SizedBox(height: 8),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Трийодтиронін вільний",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _itemDay(0, index),
              _itemDay(1, index),
              _itemDay(2, index),
              _itemDay(3, index),
              _itemDay(4, index),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildWidgetTime(0, index),
              _buildWidgetTime(1, index),
              _buildWidgetTime(2, index),
              _buildWidgetTime(3, index),
              _buildWidgetTime(4, index),
            ],
          ),
        ]);
  }

  Widget _buildWidgetTime(int indexDay, int indexPatient) {
    List<Calendar> calendarListPatient = listPatient[indexPatient].listCalendar;
    double margin = 4;
    if (indexDay == 0) {
      margin = 0;
    }
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: margin),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: calendarListPatient[indexDay].timeList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                _itemTime(index, calendarListPatient, indexDay)),
      ),
    );
  }

  Widget _itemDay(int indexDay, int indexPatient) {
    List<Calendar> calendarListPatient = listPatient[indexPatient].listCalendar;
    Color color = violetColor;
    EdgeInsetsGeometry padding = const EdgeInsets.all(8);
    if (calendarListPatient[indexDay].isSelected) {
      _indexDay = indexDay;
      color = yellowColor;
      padding = const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8);
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_indexDay != -1 && _indexDay != indexDay) {
            calendarListPatient[_indexDay].isSelected = false;
          }
          calendarListPatient[indexDay].isSelected = true;
          if (_indexTime != -1) {
            calendarListPatient[_indexDay].timeList[_indexTime].isSelected =
                false;
            _indexTime = -1;
          }
          _indexDay = indexDay;
        });
      },
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(16.0))),
        child: Column(
          children: <Widget>[
            Text(
              calendarListPatient[indexDay].dateOfWeek,
              style: const TextStyle(color: Colors.white),
            ),
            Text(calendarListPatient[indexDay].dateOfMonth,
                style: const TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }

  Widget _itemTime(
      int index, List<Calendar> calendarListPatient, int indexDay) {
    Color color = violetColor;
    if (calendarListPatient[indexDay].timeList[index].isSelected) {
      _indexTime = index;
      color = yellowColor;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_indexTime != index || _indexDay != indexDay) {
            if (_indexDay != -1) {
              calendarListPatient[_indexDay].isSelected = false;
            }
            calendarListPatient[indexDay].isSelected = true;
            if (_indexTime != -1) {
              calendarListPatient[_indexDay].timeList[_indexTime].isSelected =
                  false;
            }
            calendarListPatient[indexDay].timeList[index].isSelected = true;
            _indexDay = indexDay;
            _indexTime = index;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(4.0))),
        child: Text(calendarListPatient[indexDay].timeList[index].time,
            textAlign: TextAlign.center),
      ),
    );
  }
}

const List<String> timeList = ["AM", "PM"];
const List<String> dateList = ["7.31.2020", "1.08.2020", "2.08.2020"];
const List<String> calificacionList = ["text1", "text2", "text3"];

const textBlackColor = Color(0xFF000000);
const textBrownColor = Color(0xFF737083);
const whiteColor = Color(0xFFFFFFFF);
const blueColor = Color(0xFFDEF5FD);
const yellowColor = Color(0xFFF6B341);
const greenColor = Color(0xFF27AE60);
const violetColor = Color(0xFFAC72C1);
const dividerColor = Color(0xFFD0CFD6);
const textBlueColor = Color(0xFF4FC8FF);

List<Calendar> calendarList = [
  Calendar(false, "LUN", "8 JUL",
      [Time(false, "07:00 am"), Time(false, "08:00 pm")]),
  Calendar(
      true, "MAR", "9 JUL", [Time(true, "08:00 am"), Time(false, "09:00 pm")]),
  Calendar(false, "MIE", "10 JUL",
      [Time(false, "09:00 am"), Time(false, "10:00 pm")]),
  Calendar(false, "JUE", "11 JUL",
      [Time(false, "08:00 am"), Time(false, "07:00 pm")]),
  Calendar(false, "VIE", "12 JUL",
      [Time(false, "10:00 am"), Time(false, "07:00 pm")])
];

List<Patient> listPatient = [
  Patient(false, calendarList),
  Patient(false, calendarList),
  Patient(false, calendarList),
  Patient(false, calendarList)
];

class Patient {
  bool isOpenMap = false;
  List<Calendar> listCalendar;

  Patient(this.isOpenMap, this.listCalendar);
}

class Calendar {
  bool isSelected = false;
  String dateOfWeek;
  String dateOfMonth;
  List<Time> timeList;

  Calendar(this.isSelected, this.dateOfWeek, this.dateOfMonth, this.timeList);
}

class Time {
  bool isSelected = false;
  String time;

  Time(this.isSelected, this.time);
}
