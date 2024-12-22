import 'package:flutter/material.dart';
import 'package:kkk/admin/login_admin.dart';
import 'package:kkk/user/login_user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 100,
                    bottom: 10,
                    left: 40,
                    right: 45,
                  ),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 70,
                      child: const Row(
                        children: [
                          Text(
                            'Khedma',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Attendence',
                            style: TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                )
              ],
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: const Image(image: AssetImage('images/4170461.png'))),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.black87,
                        fixedSize: const Size(250, 70)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoggingAdmin()),
                      );
                    },
                    child: const Text('Login as Admin',
                        style: TextStyle(color: Colors.white)))
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.deepPurpleAccent,
                      fixedSize: const Size(250, 70),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Logging()),
                      );
                    },
                    child: const Text('Login as User',
                        style: TextStyle(color: Colors.white))),
              ],
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ));
  }
}
