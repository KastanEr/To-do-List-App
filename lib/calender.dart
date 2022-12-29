import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPage createState() => _CalendarPage();

}
List<DateTime> eventdate = [DateTime(2022,12,30),DateTime(2022,12,25)];
List<String> eventname = ['플러터 프로젝트','보고서 작성'];
Map<DateTime, List<CleanCalendarEvent>> addevent={};


class _CalendarPage extends State<CalendarPage> {

//   Map<DateTime, List<CleanCalendarEvent>> add(){
//
//   for(int i=0; i<eventdate.length; i++){
//     addevent=new Map.from({eventdate[i] : [
//     CleanCalendarEvent(eventname[0],
//     startTime: DateTime.now(),
//     endTime: DateTime.now(),)
//     ]});
//   }
//   return addevent;
// }


  Map<DateTime, List<CleanCalendarEvent>> _events = {
    eventdate[0] : [
     CleanCalendarEvent(eventname[0],
     startTime: DateTime.now(),
     endTime: DateTime.now(),)
     ],
    eventdate[1] : [
      CleanCalendarEvent(eventname[1],
        startTime: DateTime.now(),
        endTime: DateTime.now(),)
    ]
  };

  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Calendar(
          startOnMonday: true,
          weekDays: ['월', '화', '수', '목', '금', '토', '일'],
          events: _events,
          isExpandable: true,
          eventDoneColor: Colors.green,
          selectedColor: Colors.grey,
          todayColor: Colors.blue,
          eventColor: Colors.pink,
          locale: 'korea',
          todayButtonText: 'Today',
          isExpanded: true,
          expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          dayOfWeekStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
        ),

    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }
}
