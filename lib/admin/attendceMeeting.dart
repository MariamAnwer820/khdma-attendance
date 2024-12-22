import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkk/admin/attendence.dart';
import 'package:kkk/admin_cubit/viewAttendence_cubit/view_attendence_cubit.dart';
import 'package:kkk/admin_cubit/viewAttendence_cubit/view_attendence_state.dart';

class Attendcemeeting extends StatefulWidget {
  const Attendcemeeting({super.key});

  @override
  State<Attendcemeeting> createState() => _AttendcemeetingState();
}

class _AttendcemeetingState extends State<Attendcemeeting> {
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text(
          'Attendence',
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocConsumer<ViewAttendenceCubit, ViewAttendenceState>(
        listener: (context, state) {
          if(state is ViewAttendenceSuccess){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Attendence()));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                                            controller: nameController,
                                            decoration: InputDecoration(
                                                hintText: "Meeting Name",
                                                prefixIcon: Icon(Icons.person_outline)),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'This field is required';
                                              } 
                                              return null;
                                            },
                                          ),
                      
                               SizedBox(
                                height: 50,
                               ),
                                           Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Material(
                                                borderRadius: BorderRadius.circular(20),
                                                elevation: 5,
                                                child: ConditionalBuilder(
                                                  condition:
                                                      state is! ViewAttendenceLoading,
                                                  builder: (context) => ElevatedButton(
                                                    onPressed: () {
                                                      if (_formkey.currentState
                                                              ?.validate() ??
                                                          false) {
                                                        BlocProvider.of<
                                                                    ViewAttendenceCubit>(
                                                                context)
                                                            .viewAttendence(
                                                          meetingName: nameController.text,
                                                          
                                                        );
                                                      }
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.deepPurpleAccent,
                                                      // minimumSize: const Size(80, 60),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(20),
                                                      ),
                                                      side: const BorderSide(
                                                        width: 1.5,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      'Send',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 30,
                                                        fontFamily: 'Gabriela',
                                                      ),
                                                    ),
                                                  ),
                                                  fallback: (context) =>
                                                      const CircularProgressIndicator(),
                                                ),
                                              ),
                                            ],
                            
                ),
                  ]
                
                            ),
              ),
          );
        },
        )
      );
  }
}