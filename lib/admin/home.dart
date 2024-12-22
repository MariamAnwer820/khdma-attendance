import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkk/admin/adduser.dart';
import 'package:kkk/admin/attendceMeeting.dart';
import 'package:kkk/admin/createmeeting.dart';
import 'package:kkk/admin/profile.dart';
import 'package:kkk/admin_cubit/Createmeeting_cubit/create_meeting_cubit.dart';
import 'package:kkk/admin_cubit/Createmeeting_cubit/create_meeting_state.dart';
import 'package:kkk/meeting.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  void initState() {
    super.initState();
    // Fetch meetings when the widget is first built
    context.read<CreateMeetingCubit>().getMeeting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text(
          'Admin Home',
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              radius: 80,
              backgroundColor: Color.fromARGB(255, 103, 74, 184),
              child: CircleAvatar(
                radius: 78,
                backgroundImage: AssetImage('images/download.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<CreateMeetingCubit, CreateMeetingState>(
                listener: (context, state) {
              if (state is GetMeetingError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
              }
            }, builder: (context, state) {
              if (state is GetMeetingLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetMeetingSuccess) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.getMeeting.all!.map((meeting) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Meeting(
                          meetingname: meeting.meetingName,
                          date: meeting.meetingDate,
                          time: meeting.meetingTime,
                        ),
                      );
                    }).toList(),
                  ),
                );
              } else {
                return const Center(child: Text("Error: Please try again."));
              }
            }),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateMeeting()));
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(),
                      color: Color.fromARGB(255, 103, 74, 184),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.meeting_room,
                          color: Colors.white,
                        ),
                        Text(
                          'Create meeting',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(),
                      color: Color.fromARGB(255, 103, 74, 184),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_box_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Attendcemeeting()));
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(),
                      color: Color.fromARGB(255, 103, 74, 184),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_task_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Attendance',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Adduser()));
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(),
                      color: Color.fromARGB(255, 103, 74, 184),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add,
                          color: Colors.white,
                        ),
                        Text(
                          'Add user',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
