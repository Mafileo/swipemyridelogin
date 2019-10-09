import 'package:flutter/material.dart';
import 'package:signin/social_media_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(SignIn());

final FirebaseAuth mAuth = FirebaseAuth.instance;

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sign In'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  String _email, _password;
  //NewUser newUser = NewUser();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     widget.title,
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.deepPurple, Colors.blueAccent]),
        ),
        child: Center(
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  //Logo for SMR
                  Container(
                    constraints: BoxConstraints.expand(
                      height: 150.0,
                    ),
                    child: Image.asset("assets/images/SMRT.png",
                        fit: BoxFit.cover),
                  ),

                  SizedBox(height: 50),

                  Container(
                    width: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Form
                          Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email),
                                      border: OutlineInputBorder(),
                                      hintText: 'Email'),
                                  validator: (input) => !input.contains('@')
                                      ? 'Not a valid Email'
                                      : null,
                                  onSaved: (input) => _email = input,
                                ),

                                SizedBox(height: 20),
                                //Password
                                TextFormField(
                                  obscureText: true,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      prefixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder(),
                                      hintText: 'Password'),
                                  validator: (input) => input.length < 8
                                      ? 'You need at least 8 characters'
                                      : null,
                                  onSaved: (input) => _password = input,
                                ),

                                SizedBox(height: 20),

                                ButtonTheme(
                                  minWidth: 300,
                                  height: 50,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    onPressed: _submit,
                                    textColor: Colors.white,
                                    padding:
                                        EdgeInsets.fromLTRB(100, 0, 100, 0),
                                    color: Colors.blue,
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Don\'t have an account?',
                                      style: TextStyle(color: Colors.white),
                                      ),
                                    InkWell(
                                      child: Text(
                                        'Sign up Now!',
                                        style: TextStyle(color: Colors.blue),
                                        ),
                                        onTap: (){
                                          print('SignUp');
                                          Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) => new NewUser()
                                          ));
                                        },
                                    ),

                                  ],
                                ),

                                SizedBox(height: 20),

                                
                              ],
                            ),
                          ),
                          //Email

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Divider(
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'OR',
                                style: TextStyle(color: Colors.white),
                              ),
                              Expanded(
                                child: Divider(
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20),

                          Text(
                            'Sign in with Social Networks',
                            style: TextStyle(color: Colors.white),
                          ),

                          SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                width: 140,
                                height: 50,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  textColor: Colors.white,
                                  color: Colors.indigoAccent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(SocialMedia.facebook, size: 20),
                                      SizedBox(width: 2),
                                      Text('Facebook'),
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 140,
                                height: 50,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  textColor: Colors.white,
                                  color: Colors.redAccent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(SocialMedia.google, size: 20),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text('Google'),
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() async {
    FirebaseUser user;

    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      try {
        user = (await mAuth.signInWithEmailAndPassword(
            email: _email, password: _password)).user;
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => new HomeScreen()
            ));
      } catch (e) {
        print(e);
        showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text(
                'Error Message',
                style: TextStyle(color: Colors.purple),
              ),
              content: Text('Incorrect email or password.'),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Dismiss',
                    style: TextStyle(color: Colors.purple),
                    ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
        );
      }
    }
  }
}

class NewUser extends StatefulWidget{
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser>{
  final formKey = GlobalKey<FormState>();
  String _email, _password;


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     widget.title,
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.deepPurple, Colors.blueAccent]),
        ),
        child: Center(
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  //Logo for SMR
                  Container(
                    constraints: BoxConstraints.expand(
                      height: 150.0,
                    ),
                    child: Image.asset("assets/images/SMRT.png",
                        fit: BoxFit.cover),
                  ),

                  SizedBox(height: 50),

                  Container(
                    width: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Form
                          Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email),
                                      border: OutlineInputBorder(),
                                      hintText: 'Email'),
                                  validator: (input) => !input.contains('@')
                                      ? 'Not a valid Email'
                                      : null,
                                  onSaved: (input) => _email = input,
                                ),

                                SizedBox(height: 20),
                                //Password
                                TextFormField(
                                  obscureText: true,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      prefixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder(),
                                      hintText: 'Password'),
                                  validator: (input) => input.length < 8
                                      ? 'You need at least 8 characters'
                                      : null,
                                  onSaved: (input) => _password = input,
                                ),

                                SizedBox(height: 20),

                                ButtonTheme(
                                  minWidth: 300,
                                  height: 50,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    onPressed: signUpWithEmailPassword,
                                    textColor: Colors.white,
                                    padding:
                                        EdgeInsets.fromLTRB(100, 0, 100, 0),
                                    color: Colors.blue,
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20), 
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  void signUpWithEmailPassword() async {
    bool sameEmail = false;
    FirebaseUser user;

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(_email);
      print(_password);
      try {
        user = (await mAuth.createUserWithEmailAndPassword(
            email: _email, password: _password)).user;
            Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => new MyHomePage()
      ));
      //this.dispose();
      } catch (e) {
        print(e);
        showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text(
                'Error Message',
                style: TextStyle(color: Colors.purple),
              ),
              content: Text('The email is already in use. Please use another email.'),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Dismiss',
                    style: TextStyle(color: Colors.purple),
                    ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
        );
      }
    }
  }
  
}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Swipe My Ride'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.deepPurple, Colors.blueAccent]),
        ),
      ),
    );
  }
  
}
  
  

