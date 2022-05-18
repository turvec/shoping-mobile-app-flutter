import 'package:flutter/material.dart';
import 'package:shopa/ui/account/home.dart';
import 'package:shopa/ui/auth/login.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text("Welcome to Shopa", style: Theme.of(context).textTheme.headline2,),
              SizedBox(
                height: 10,
              ),
              Text('the best shop', style: Theme.of(context).textTheme.bodyText2,),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
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
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(
                      builder: ((context) => Home())
                    ));
                  },
                   child: Text("Register")
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: ((context) => Login())
                    ));
                  },
                  child: Text('Login Hare', style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.normal))
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}