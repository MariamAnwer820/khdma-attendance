import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kkk/admin/viewQR.dart';
import 'package:kkk/admin_cubit/Createmeeting_cubit/create_meeting_cubit.dart';
import 'package:kkk/admin_cubit/Createmeeting_cubit/create_meeting_state.dart';
import 'package:kkk/api/cache_services.dart';
import 'package:kkk/cons.dart';
import 'package:kkk/functions/snack_bar.dart';

class CreateMeeting extends StatefulWidget {
  const CreateMeeting({super.key});

  @override
  State<CreateMeeting> createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  final TextEditingController titleController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text(
          'Create Meeting',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocConsumer<CreateMeetingCubit, CreateMeetingState>(
          listener: (context, state) {
            if (state is CreateMeetingSuccess) {
              showSnackBar(context, 'Meeting Created Successfully');
               CacheService.saveData(
                key: 'MeetingURL',
                value: state.createMeeting.url,
              ).then(
                (value) {
                  MeetingURL = CacheService.getData(key: 'MeetingURL');
                  print(MeetingURL);
                  
                },
              );
            } else if (state is CreateMeetingError) {
              showSnackBar(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 15,
                      left: 50,
                      right: 50,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 50,
                      child: const Row(
                        children: [
                          Text(
                            'Khedma',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Attendance',
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  // Meeting Title
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        labelText: 'Meeting Title',
                        prefixIcon: const Icon(Icons.title_rounded),
                        hintText: 'Enter meeting title',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purpleAccent),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a meeting title';
                        }
                        return null;
                      },
                    ),
                  ),

                  // Time Picker
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                        labelText: 'Select Meeting Time',
                        prefixIcon: Icon(Icons.access_time_outlined),
                        hintText: 'Pick meeting time',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purpleAccent),
                        ),
                      ),
                      mode: DateTimeFieldPickerMode.time,
                      onChanged: (DateTime? value) {
                        setState(() {
                          selectedTime = TimeOfDay.fromDateTime(value!);
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a time';
                        }
                        return null;
                      },
                    ),
                  ),

                  // Date Picker
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                        labelText: 'Select Meeting Date',
                        helperText: 'YYYY/MM/DD',
                        prefixIcon: Icon(Icons.date_range_rounded),
                        hintText: 'Pick meeting date',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purpleAccent),
                        ),
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      onChanged: (DateTime? value) {
                        setState(() {
                          selectedDate = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a date';
                        }
                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Create Meeting Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.deepPurpleAccent,
                          fixedSize: const Size(187, 60),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            BlocProvider.of<CreateMeetingCubit>(context)
                                .createMeeting(
                                    meetingname: titleController.text,
                                    meetingtime: selectedTime!.format(context),
                                    meetingdate: DateFormat('yyyy-MM-dd')
                                        .format(selectedDate!));
                            print('Title: ${titleController.text}');
                            print(
                                'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}');
                            print(
                                'Selected Time: ${selectedTime!.format(context)}');
                          }
                        },
                        child: const Text(
                          'Create Meeting',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),



                
                    ],
                  ),

                  SizedBox(height: 40,),

                 GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QrCodePage()));
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
                          'View QR',
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
            );
          },
        ),
      ),
    );
  }
}
