import 'package:flutter/material.dart';
import 'package:muti_role_based_app/view/home_screen.dart';
import 'package:muti_role_based_app/view/student_screen.dart';
import 'package:muti_role_based_app/view/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter Age",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
                ),
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
                      sp.setString("email", emailController.text.toString());
                      sp.setString("age", ageController.text.toString());

                      // admin, student, teacher
                      sp.setString("userType", "student");
                      // sp.setString("userType", "teacher");

                      sp.setBool("isLogin", true);

                      if(sp.getString("userType") == 'student'){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentScreen()));
                      }
                      else if(sp.getString('userType') == 'teacher'){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherScreen()));
                      }
                      else{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      }


                    }, child: Text("Sign Up")),
              )

            ],
          ),
        ),
      ),
    );
  }

}


