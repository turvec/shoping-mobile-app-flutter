import 'package:flutter/material.dart';
import 'package:shopa/ui/account/home.dart';
import 'package:shopa/ui/auth/register.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Welcome to Shopa",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'the best shop',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child:
                      ElevatedButton(onPressed: () {
                         Navigator.push(context, MaterialPageRoute(
                          builder: ((context) => Home())
                        ));
                      }, child: Text("Login")),
                ),
                SizedBox(
                height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text('Forgot Password',
                         style: Theme.of(context).textTheme.bodyText2,),
                    ),
                    GestureDetector(
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(
                        builder: ((context) => Register())
                      ));
                      },
                      child: Text('Sign Up',
                      style: Theme.of(context).textTheme.bodyText2,),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
