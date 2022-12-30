// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todolist/logineduser.dart';

import '../model/todoproject.dart';

/// Example event class.
class Event {
  String title;

  Event(this.title);

  @override
  String toString() => title;
}



/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);



List<Event> eventdetail = [Event('플러터'),Event('asd'),];


List<Map<DateTime,List<Event>>> addEventday(){
  List<Map<DateTime,List<Event>>> asd=[];
  for (int i=0; i<kEventday.length; i++){
    asd.add(
        {
          kEventday[i]: [
            Event('플러터1'),
            Event('asd2'),

          ]
        }
    );
  }
  return asd;
}


List<DateTime> kEventday = [DateTime(2022, 12, 23),DateTime(2022, 12, 25)];

var _kEventSource = Map.fromIterable(
    List.generate(eventdetail.length, (index) => index), //3은 전체 일정있는 날, index는 해당날짜의 todo 번호
    key: (item) => kEventday[0], //날짜
    value: (item) => eventdetail)
..addAll({

  // for(int i=0; i<3; i++){
  //   kEventday[i]:[
  //     Event('asd'),
  //     Event('qwe'),
  //     Event('asd'),
  //     Event('qwe'),Event('asd'),
  //     Event('qwe'),
  //   ]
  // },
  // kEventday[0] : [
  //   Event('asd'),
  //   Event('qwe'),
  //   Event('asd'),
  //   Event('qwe'),Event('asd'),
  //   Event('qwe'),
  // ],
  // kEventday[1] : [
  //   Event('wer'),
  //   Event('zxc'),
  // ]
});


//일정리스트






int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();

final kFirstDay = DateTime(kToday.year, kToday.month - 6, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 6, kToday.day);