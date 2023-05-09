import 'package:flutter/material.dart';
import 'package:muti_role_based_app/view/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  // To show stored data in shared preferences in home screen
  String email = "", age = "", type = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email") ?? '';
    age = sp.getString("age") ?? '';
    type = sp.getString("userType") ?? '';
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher View"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email"),
                  Text(email.toString()),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Age"),
                  Text(age.toString()),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("User Type"),
                  Text(type.toString()),
                ],
              ),

              SizedBox(height: 40,),

              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * .8,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blueGrey,
                        textStyle: TextStyle(fontSize: 20)),
                    onPressed: () async{
                      SharedPreferences sp = await SharedPreferences.getInstance();
                      sp.clear(); // to clear all the data store in sp

                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                    }, child: Text("Logout")),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

