import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CardCalendar extends StatefulWidget {
  const CardCalendar({Key key}) : super(key: key);

  @override
  _CardCalendarState createState() => _CardCalendarState();
}

class _CardCalendarState extends State<CardCalendar> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SfCalendar(
                view: CalendarView.month,
                showDatePickerButton: false,
                monthViewSettings: MonthViewSettings(
                  showTrailingAndLeadingDates: false,
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 10),
                        child: SizedBox(
                            height: 45,
                            child: Container(
                              child: Center(
                                  child: Text("Verificação concluida",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15))),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue[800],
                              ),
                            ))),
                    SizedBox(
                        height: 45,
                        child: Container(
                          child: Center(
                              child: Text("Entrega em Andamento",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue[800],
                          ),
                        )),
                  ],
                )),
          ],
        ));
  }
}
