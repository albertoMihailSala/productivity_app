import 'package:flutter/material.dart';
import 'package:productivity_app/tasks/task_class.dart';
import 'package:productivity_app/api/notification_service.dart';
import 'dart:math';
//ignore_for_file: prefer_const_constructors

class DateTimePicker extends StatefulWidget {
  //const DateTimePicker({Key? key}) : super(key: key);
  final Task task;

  const DateTimePicker({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  // YEAR / MONTH / DAY / HOURS / MINUTES
  DateTime dateTime = DateTime.now();
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    //TO DISPLAY THE TIME PROPERLY
   final hours = dateTime.hour.toString().padLeft(2, '0');
   final minutes = dateTime.minute.toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: Text('Reminder',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade800,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.task.title,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color:  Colors.deepPurple.shade800,
              ),
            ),
            SizedBox(height: 30),
            Text('${dateTime.day}/${dateTime.month}/${dateTime.year}',
              style: TextStyle(
                fontSize: 70,
              ),
            ),
            Text('$hours:$minutes',
              style: TextStyle(
                fontSize: 70,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                 await pickDateTime();
              },
              child: Text('Pick a date & time'),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple.shade800),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 35),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                NotificationService.showReminder(
                  id: random.nextInt(2147483647),
                  title: 'Task Reminder',
                  body: widget.task.title,
                  scheduledDate: dateTime,
                  //scheduledDate: DateTime.now().add(Duration(seconds: 2)),
                );

                final snackBar = SnackBar(
                  content: Text('Reminder set'),
                  backgroundColor: Colors.deepPurple.shade800,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
                child: Text('Set reminder'),
                  style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple.shade800),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 35),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      //DATE DISPLAYED WHEN OPENING DATEPICKER
      initialDate: dateTime,
      //DATE RANGE
      firstDate: DateTime(2022),
      lastDate: DateTime(2099)
  );
  
  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context, 
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
  );

  Future pickDateTime() async {
    final date = await pickDate();
    if (date == null) {
      return; //CANCEL
    }
    final time = await pickTime();
    if (time == null) {
      return; //CANCEL
    }
    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    setState(() => this.dateTime = dateTime);
    }
}

