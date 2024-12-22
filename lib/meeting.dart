import 'package:flutter/material.dart';
import 'package:kkk/scanner.dart';

class Meeting extends StatelessWidget {
  const Meeting({super.key, this.meetingname, this.date, this.time});
  final String? meetingname;
  final String? date;
  final String? time;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Color.fromARGB(255, 103, 74, 184),
            fixedSize: const Size(250, 230),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QRScannerPage()));
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    meetingname!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    date!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    time!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
