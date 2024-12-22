import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkk/admin_cubit/adminLogin_cubit/login_admin_cubit.dart';
import 'package:kkk/admin_cubit/adminLogin_cubit/login_admin_state.dart';
import 'package:kkk/functions/snack_bar.dart';

class Adduser extends StatefulWidget {
  const Adduser({super.key});

  @override
  State<Adduser> createState() => _AdduserState();
}

class _AdduserState extends State<Adduser> {
  TextEditingController nameController = TextEditingController();

  TextEditingController idController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String dropdownvalue1 = 'male';
  var items1 = ['male', 'female'];
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginAdminCubit, LoginAdminState>(
        listener: (context, state) {
          if (state is AdduserSuccessState) {
            showSnackBar(context, "User Added Successfully");
          } else if (state is AdduserErrorState) {
            showSnackBar(context, state.ErrorMessage);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                            Colors.deepPurpleAccent,
                            Colors.deepPurpleAccent.shade200
                          ])),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3),
                      height: MediaQuery.of(context).size.height / 2.3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Text(""),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60, left: 20, right: 20),
                      child: Column(
                        children: [
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 1.6,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Add',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'User',
                                        style: TextStyle(
                                            color: Colors.deepPurpleAccent,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                        hintText: "Name",
                                        prefixIcon: Icon(Icons.person_outline)),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 30),
                                  TextFormField(
                                    controller: idController,
                                    decoration: InputDecoration(
                                        hintText: "ID",
                                        prefixIcon: Icon(Icons.numbers_sharp)),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        'Gender',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      DropdownButton(
                                        dropdownColor: Colors.white,
                                        elevation: 0,
                                        value: dropdownvalue1,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        iconSize: 30,
                                        underline: const SizedBox(),
                                        items: items1.map((String items1) {
                                          return DropdownMenuItem(
                                            value: items1,
                                            child: Text(
                                              items1,
                                              style: TextStyle(
                                                fontFamily: 'Gabriela',
                                                fontSize: 20,
                                                // color: Colors.black
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue1 = newValue!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 35),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Material(
                                        borderRadius: BorderRadius.circular(20),
                                        elevation: 5,
                                        child: ConditionalBuilder(
                                          condition:
                                              state is! AdduserloadingState,
                                          builder: (context) => ElevatedButton(
                                            onPressed: () {
                                              if (_formkey.currentState
                                                      ?.validate() ??
                                                  false) {
                                                BlocProvider.of<
                                                            LoginAdminCubit>(
                                                        context)
                                                    .adduser(
                                                  username: nameController.text,
                                                  userId: idController.text,
                                                  gender: dropdownvalue1,
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
                                              'Add',
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
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
