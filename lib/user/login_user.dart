import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkk/api/cache_services.dart';
import 'package:kkk/cons.dart';
import 'package:kkk/functions/snack_bar.dart';
import 'package:kkk/user/userhome.dart';
import 'package:kkk/user_cubit/auth_cubit/user_auth_cubit.dart';
import 'package:kkk/user_cubit/auth_cubit/user_auth_state.dart';

class Logging extends StatefulWidget {
  Logging({super.key});

  @override
  State<Logging> createState() => _LoggingState();
}

class _LoggingState extends State<Logging> {
  TextEditingController nameController = TextEditingController();

  TextEditingController idController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String dropdownvalue1 = 'male';
  var items1 = ['male', 'female'];
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
          'Login as User',
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: BlocConsumer<UserAuthCubit, UserAuthState>(
        listener: (context, state) {
          if (state is UserAuthSuccessInitial) {
            if (state.userLogin.status == 'Success') {
              showSnackBar(context, "Login Successful");
              CacheService.saveData(
                key: 'token',
                value: state.userLogin.token,
              ).then(
                (value) {
                  print('login successfully');
                  token = CacheService.getData(key: 'token');
                  print(token);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homeuser(),
                    ),
                  );
                },
              );
            } else {
              showSnackBar(context, "This user not found");
            }
          } else if (state is UserAuthErrorInitial) {
            showSnackBar(context, state.errorMessage);
            print(state.errorMessage);
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
                                        'Khedma',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Attendence',
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
                                              state is! UserAuthLoadingInitial,
                                          builder: (context) => ElevatedButton(
                                            onPressed: () {
                                              if (_formkey.currentState
                                                      ?.validate() ??
                                                  false) {
                                                BlocProvider.of<UserAuthCubit>(
                                                        context)
                                                    .Userlog(
                                                  userName: nameController.text,
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
                                              'Login',
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
