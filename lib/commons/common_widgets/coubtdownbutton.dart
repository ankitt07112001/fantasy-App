import 'dart:async';

import 'package:flutter/material.dart';

class CountdownButton extends StatefulWidget {
  final Duration duration;
  final VoidCallback onPressed;
  final Widget child;

  const CountdownButton({
    Key? key,
    required this.duration,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  _CountdownButtonState createState() => _CountdownButtonState();
}

class _CountdownButtonState extends State<CountdownButton> {
  late Timer _timer;
  late int _secondsLeft;

  @override
  void initState() {
    super.initState();
    _secondsLeft = widget.duration.inSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsLeft--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _secondsLeft > 0 ? null : widget.onPressed,
      child: _secondsLeft > 0
          ? Text('Resend OTP in $_secondsLeft seconds')
          : widget.child,
    );
  }
}
