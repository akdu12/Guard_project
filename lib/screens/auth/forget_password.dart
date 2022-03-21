
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guard/constants.dart';
import 'package:guard/screens/auth/login_screen.dart';

class resetScreen extends StatelessWidget {
  const resetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = new TextEditingController();
    final _auth = FirebaseAuth.instance;
    final resetButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(25),
      color: kPrimaryColor,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20,15,20,15),
        minWidth: 50,
        onPressed: ()
          async{
            await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text).then((value){
              Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
            });
          },

        child: Text(
          "Reset Password",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),



        ),),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          //going back to the root
          icon: Icon(Icons.arrow_back, color: kPrimaryColor),
          onPressed: (){
            Navigator.of(context).pop();
          },

        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: 150,
              child: Image.asset("assets/images/logo-2.png",fit: BoxFit.contain,
              )
          ),
          Text("\nReset Your Password\n",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: kPrimaryColor),),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              autofocus: false,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value)
              {
                if(value!.isEmpty){
                  return ("Please Enter Your Email");
                }
                //reg expression for email validation
                if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){

                  return("Please Enter a Valid Email");

                }
                return null;

              },
              onSaved: (value){

                emailController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Registered Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  )
              ),

            )
          ),
          Text("\nAn email will be sent to you to reset your password.\n Make sure you put your registered email correctly\n",style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic,color: kPrimaryColor)),
          resetButton

          /*ElevatedButton(
            child: const Text("Reset Password"),
            onPressed:() async{
            await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text).then((value){
              Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
            });
          },
            style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15)

          ))],*/
      ]),
    );
  }
}
