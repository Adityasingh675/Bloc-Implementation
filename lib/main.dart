import 'package:bloc_login_page_app/page2.dart';
import 'package:flutter/material.dart';

import 'bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  changePage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2()));
  }
  final bloc = Bloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Bloc'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                stream: bloc.email,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: (s) => bloc.emailChanged.add(s),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      errorText: snapshot.error,
                    ),
                  );
                }
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                stream: bloc.password,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: (s) => bloc.passwordChanged.add(s),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      errorText: snapshot.error,
                    ),
                  );
                }
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                builder: (context, snapshot) {
                  return RaisedButton(
                    child: Text('Submit'),
                    color: Colors.blueGrey,
                    onPressed: snapshot.hasData?() => changePage():null,
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
