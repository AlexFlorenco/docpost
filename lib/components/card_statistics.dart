import 'package:flutter/material.dart';

class CardStatistics extends StatefulWidget {
  final width;

  const CardStatistics({super.key, required this.width});

  @override
  State<CardStatistics> createState() => _CardStatisticsState();
}

class _CardStatisticsState extends State<CardStatistics> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'A Pagar',
                    style: TextStyle(color: Colors.blueGrey[300]),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 3,
                    color: Colors.blue,
                  ),
                  const Spacer(),
                  Text(
                    '06',
                    style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue[700]),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
