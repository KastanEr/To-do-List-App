// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

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



final _kEventSource = Map.fromIterable(
    List.generate(3, (index) => index), //3은 전체 일정있는 날, index는 해당날짜의 todo 번호
    key: (item) => DateTime.utc(2022, 12, item), //날짜
    value: (item) => List.generate(
        item+1, (index) => Event('일정${index + 1}')))
//4는 특정날짜를 클릭했을 때 나오는 todo의 수   그 뒤는 todo의 내용
  ..addAll({

    kEventday[0]: [
      Event('개인과제'),
    ],
    kEventday[1]:[
      Event('크리스마스'),
    ],
    kToday: [
      Event('오늘의 일정 1'),
      Event('오늘의 일정 2'),


    ],
  });

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
List<DateTime> kEventday = [DateTime(2022, 12, 23),DateTime(2022, 12, 25)];
final kFirstDay = DateTime(kToday.year, kToday.month - 6, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 6, kToday.day);