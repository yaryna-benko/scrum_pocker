import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scrum_pocker/components/constrains.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int _startMinutes = 0;
  int _startSeconds = 30; 
  int _currentMinutes = 0; 
  int _currentSeconds = 30; 

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
   int totalSeconds = (_startMinutes * 60) + _startSeconds; // Загальна кількість секунд
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (totalSeconds == 0) {
          _timer.cancel(); // Зупинка таймера, коли досягнуто 0
          navigateToNextPage(); // Перехід на наступну сторінку
        } else {
          totalSeconds--;
          _currentMinutes = totalSeconds ~/ 60; // Отримання поточної кількості хвилин
          _currentSeconds = totalSeconds % 60; // Отримання поточної кількості секунд
        }
      });
    });
  }

  void navigateToNextPage() {
    Navigator.pushNamed(context, 'result');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_currentMinutes:${_currentSeconds.toString().padLeft(2, '0')}',
            style: TextStyle(color: isNightModeEnabled ? Colors.white : kPrimaryButtonColor, fontSize: 26),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); 
    super.dispose();
  }
}

