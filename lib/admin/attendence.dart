import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkk/admin_cubit/viewAttendence_cubit/view_attendence_cubit.dart';
import 'package:kkk/admin_cubit/viewAttendence_cubit/view_attendence_state.dart';

class Attendence extends StatefulWidget {
  const Attendence({super.key});

  @override
  State<Attendence> createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
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
          'Attendance',
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocConsumer<ViewAttendenceCubit, ViewAttendenceState>(
        listener: (context, state) {
          if (state is ViewAttendenceError) {
            // Show a Snackbar or any error message to the user
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.MessageError)),
            );
          }
        },
        builder: (context, state) {
          if (state is ViewAttendenceSuccess) {
            // Check if presentUser is not null or empty
            if (state.allPresent.presentUser != null && state.allPresent.presentUser!.isNotEmpty) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Name')),
                    ],
                    rows: state.allPresent.presentUser!.map((user) {
                      return DataRow(cells: [
                        DataCell(Text(user)),
                      ]);
                    }).toList(),
                  ),
                ),
              );
            } else {
              return Center(child: Text("No attendees available."));
            }
          } else if (state is ViewAttendenceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("Error loading attendance."));
          }
        },
      ),
    );
  }
}