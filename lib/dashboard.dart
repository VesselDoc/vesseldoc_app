import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vesseldoc_app/form_creator.dart';
import 'package:vesseldoc_app/form_list_screen.dart';
import 'package:vesseldoc_app/sign_supervisor.dart';
import 'package:vesseldoc_app/sign_worker.dart';
import 'package:vesseldoc_app/splash_screen.dart';
import 'package:vesseldoc_app/tools.dart';
import 'package:vesseldoc_app/workers_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();

  String message;
  bool showSnackBar;

  DashboardScreen({this.message, this.showSnackBar});
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      if (widget.showSnackBar == true) {
        _scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Row(
            children: <Widget>[
              new Icon(Icons.check),
              new SizedBox(
                width: 15,
                height: 40,
              ),
              new Text(widget.message),
            ],
          ),
        ));
      }
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var tools = new Tools();

  List<Widget> listOfPortaitWidgets() {
    List<Widget> listOfWidgets = new List<Widget>();
    listOfWidgets.add(
      Expanded(
        child: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => FormCreatorScreen())),
          child:
              menuItem("Create new form", "assets/workers3.png", 0XFFBF935A, 2),
        ),
      ),
    );
    listOfWidgets.add(
      SizedBox(height: MediaQuery.of(context).size.width * 0.01),
    );
    listOfWidgets.add(
      Expanded(
        child: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => FormListScreen())),
          child: menuItem(
              "Fill out form", "assets/filloutform3.png", 0XFFBF935A, 2),
        ),
      ),
    );
    listOfWidgets.add(
      SizedBox(height: MediaQuery.of(context).size.width * 0.01),
    );
    listOfWidgets.add(
      Expanded(
        child: GestureDetector(
          onTap: () => {
            if (tools.currentUserLoggedIn.role == "Worker")
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SignWorkerScreen()))
              }
            else
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SignSupervisorScreen()))
              }
          },
          child: menuItem("Sign", "assets/sign2.png", 0XFFBF935A, 2),
        ),
      ),
    );
    if (tools.currentUserLoggedIn.role != "Worker") {
      listOfWidgets.add(
        SizedBox(height: MediaQuery.of(context).size.width * 0.01),
      );
      listOfWidgets.add(
        Expanded(
          child: GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => WorkersScreen())),
              child: menuItem(
                  "Manage workers", "assets/workers2.png", 0XFFBF935A, 2)),
        ),
      );
    }
    return listOfWidgets;
  }

  List<Widget> listOfLandscapeWidgets() {
    List<Widget> listOfWidgets = new List<Widget>();
    if (tools.currentUserLoggedIn.role != "Worker") {
      listOfWidgets.add(
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => FormCreatorScreen())),
                  child: menuItem(
                      "Create new form", "assets/workers3.png", 0XFFBF935A, 2),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Expanded(
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => FormListScreen())),
                  },
                  child: menuItem("Fill out form", "assets/filloutform3.png",
                      0XFFBF935A, 2),
                ),
              ),
            ],
          ),
        ),
      );
      listOfWidgets.add(
        SizedBox(height: MediaQuery.of(context).size.width * 0.01),
      );
      listOfWidgets.add(
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SignSupervisorScreen())),
                        child:
                            menuItem("Sign", "assets/sign2.png", 0XFFBF935A, 2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Expanded(
                child: GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => WorkersScreen())),
                    child: menuItem("Manage workers", "assets/workers2.png",
                        0XFFBF935A, 2)),
              ),
            ],
          ),
        ),
      );
    } else {
      listOfWidgets.add(
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => FormCreatorScreen())),
                  child: menuItem(
                      "Create new form", "assets/workers3.png", 0XFFBF935A, 2),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SignWorkerScreen())),
                  child: menuItem("Sign", "assets/sign2.png", 0XFFBF935A, 2),
                ),
              ),
            ],
          ),
        ),
      );
      listOfWidgets.add(
        SizedBox(height: MediaQuery.of(context).size.width * 0.01),
      );
      listOfWidgets.add(
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => FormListScreen())),
                  },
                  child: menuItem("Fill out form", "assets/filloutform3.png",
                      0XFFBF935A, 2),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return listOfWidgets;
  }

  Widget dashBoard() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: listOfPortaitWidgets(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: listOfLandscapeWidgets(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget menuItem(
      String itemName, String itemImage, int firstColor, int secondColor) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          gradient: new LinearGradient(
              colors: [Color(firstColor).withOpacity(0.6), Color(secondColor)],
              begin: Alignment.centerLeft,
              end: new Alignment(1, 1))),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(
                  new Radius.circular(10.0),
                ),
                image: DecorationImage(
                    image: new AssetImage(itemImage), fit: BoxFit.cover),
              ),
            ),
          ),
          Center(
            child: Text(
              itemName,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromARGB(255, 30, 63, 90),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 147, 90),
        title: Text("Dashboard"),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              setState(() {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                  (Route<dynamic> route) => false,
                );
                tools.currentUserLoggedIn = null;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: "Sign out",
                child: Text('Sign out'),
              ),
            ],
          ),
        ],
      ),
      body: dashBoard(),
    );
  }

  void choiceAction() {
    print("");
  }
}
