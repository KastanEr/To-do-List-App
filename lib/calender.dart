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
  final Map<DateTime, List<CleanCalendarEvent>> _events = {
    DateTime(2022,12,31) : [
     CleanCalendarEvent('장보기',
     startTime: DateTime(2022,12,31,10,0),
     endTime: DateTime(2022,12,31,12,0),),
     CleanCalendarEvent('택배 반품하기',
        startTime: DateTime(2022,12,30,14,0),
        endTime: DateTime(2022,12,30,16,0),)
     ],
    
    eventdate[0] : [
      CleanCalendarEvent('쓰레기 버리기',
        startTime: DateTime(2022,12,30,10,0),
        endTime: DateTime(2022,12,30,12,0),)
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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('캘린더'),
      ),
      body: Calendar(
          startOnMonday: true,
          weekDays: const ['월', '화', '수', '목', '금', '토', '일'],
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
          dayOfWeekStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
        ),

    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }
}
