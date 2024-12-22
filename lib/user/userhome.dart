import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkk/admin/profile.dart';
import 'package:kkk/admin_cubit/Createmeeting_cubit/create_meeting_cubit.dart';
import 'package:kkk/admin_cubit/Createmeeting_cubit/create_meeting_state.dart';
import 'package:kkk/meeting.dart';

class Homeuser extends StatefulWidget {
  const Homeuser({super.key});

  @override
  State<Homeuser> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<Homeuser> {
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
          ' Home',
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
          ],
        ),
      ),
    );
  }
}
