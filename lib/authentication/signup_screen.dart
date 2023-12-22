import 'package:flutter/material.dart';
import 'package:shuttleride/authentication/login_screen.dart';
import 'package:shuttleride/methods/common_methods.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}



class _SignUpScreenState extends State<SignUpScreen>
{
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  checkIfNetworkIsAvailable()
  {
    cMethods.checkConnectivity(context);

    signUpFormValidation();

  }

  signUpFormValidation()
  {
    if(userNameTextEditingController.text.trim().length < 3)
    {
      cMethods.displaySnackBar("Your name must be at least 4 or more characters.", context);
    }
    else if(!emailTextEditingController.text.contains("@"))
    {
      cMethods.displaySnackBar("Please write valid email.", context);
    }
    else if(passwordTextEditingController.text.trim().length < 5)
    {
      cMethods.displaySnackBar("Your password must be at least 6 or more characters.", context);
    }
    else
    {
      //register user
    }
  }



  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,90,20,20),
          child: Column(
            children: [

              Image.asset(
                "assets/images/bluelogo.jpg"
              ),

              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Create a User\'s Account",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),

                ),
              ),



              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [

                    TextField(
                      controller: userNameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Name",
                        labelStyle: TextStyle(
                          fontSize: 14
                        ),

                      ),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),


                    ),

                    const SizedBox(height: 22,),

                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "User Email",
                        labelStyle: TextStyle(
                            fontSize: 14
                        ),

                      ),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 22,),

                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Password",
                        labelStyle: TextStyle(
                            fontSize: 14
                        ),

                      ),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 22,),

                    ElevatedButton(
                      onPressed: ()
                      {
                        checkIfNetworkIsAvailable();
                        },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 80)
                      ),
                      child: const Text(
                        "Sign Up"
                      ),
                    ),

                  ],
                ),
              ),

              //textbutton
              TextButton(
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
                },
                child: const Text(
                  "Already have an Account? Login Here",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
