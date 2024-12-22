import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkk/admin/home.dart';
import 'package:kkk/admin_cubit/adminLogin_cubit/login_admin_cubit.dart';
import 'package:kkk/admin_cubit/adminLogin_cubit/login_admin_state.dart';
import 'package:kkk/api/cache_services.dart';
import 'package:kkk/cons.dart';
import 'package:kkk/functions/snack_bar.dart';

class LoggingAdmin extends StatefulWidget {
  const LoggingAdmin({super.key});

  @override
  State<LoggingAdmin> createState() => _LoggingAdminState();
}

class _LoggingAdminState extends State<LoggingAdmin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
          'Login as admin',
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: BlocConsumer<LoginAdminCubit, LoginAdminState>(
        listener: (context, state) {
          if (state is LoginAdminSuccessState) {
            if (state.adminLogin.status == 'Success') {
              showSnackBar(context, "Login Successful");
              CacheService.saveData(
                key: 'token',
                value: state.adminLogin.token,
              ).then(
                (value) {
                  print('login successfully');
                  token = CacheService.getData(key: 'token');
                  print(token);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeAdmin(),
                    ),
                  );
                },
              );
            } else {
              showSnackBar(context, "This user not found");
            }
          } else if (state is LoginAdminErrorState) {
            showSnackBar(context, state.ErrorMessage);
            print(state.ErrorMessage);
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
                                      } else if (!value.endsWith('_Admin')) {
                                        return 'Name must end with _Admin';
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
                                  TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        prefixIcon:
                                            Icon(Icons.password_outlined)),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
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
                                              state is! LoginAdminloadingState,
                                          builder: (context) => ElevatedButton(
                                            onPressed: () {
                                              if (_formkey.currentState
                                                      ?.validate() ??
                                                  false) {
                                                BlocProvider.of<
                                                            LoginAdminCubit>(
                                                        context)
                                                    .logAdmin(
                                                  usename: nameController.text,
                                                  ID: idController.text,
                                                  password:
                                                      passwordController.text,
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
