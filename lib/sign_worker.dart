import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vesseldoc_app/form_details_worker.dart';
import 'package:vesseldoc_app/tools.dart';
import 'filled_form.dart';
import 'form_structure.dart';

class SignWorkerScreen extends StatefulWidget {
  @override
  _SignWorkerScreenState createState() => _SignWorkerScreenState();

  FormStructure formStructure;
  SignWorkerScreen({this.formStructure});
}

class _SignWorkerScreenState extends State<SignWorkerScreen> {
  @override
  void initState() {
    super.initState();
    _future = tools.getListOfFilledOutForms();
  }

  var tools = Tools();
  Future<List<FilledForm>> _future;

  Widget getIcon(bool isSigned) {
    if (isSigned == true) {
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.clear,
        color: Colors.red,
      );
    }
  }

  updateWidget() {
    setState(() {
      _future = tools.getListOfFilledOutForms();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 63, 90),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 147, 90),
        title: Text("Sign"),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () => {updateWidget()},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.update,
              ),
            ),
          ),
        ],
      ),
      body: Container(
          color: Color.fromARGB(255, 30, 63, 90),
          child: Center(
              child: Container(
                  decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                      ),
                    ],
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(10.0)),
                    color: Color.fromARGB(255, 245, 245, 245),
                  ),
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "List of Active Forms",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Expanded(child: buildList()),
                    ],
                  )))),
    );
  }

  Widget buildList() {
    return Container(
      child: FutureBuilder<List<FilledForm>>(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  FilledForm filledForm = snapshot.data[index];
                  return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => FormDetailsWorkerScreen(
                                  filledForm: filledForm))),
                      child: Card(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.64,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.26,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "Name",
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(filledForm.name),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.26,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "Timestamp",
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(filledForm.dateTime),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Signed",
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        getIcon(filledForm.isSigned),
                                      ],
                                    ),
                                  ]))));
                });
          } else {
            return Center(child: new CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
