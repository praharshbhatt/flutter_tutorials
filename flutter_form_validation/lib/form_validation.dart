import 'package:flutter/material.dart';
import 'package:flutterformvalidation/form_display.dart';

class FormValidation extends StatelessWidget {
  TextEditingController _tecFirstName = new TextEditingController(),
      _tecLastName = new TextEditingController(),
      _tecEmail = new TextEditingController(),
      _tecPhone = new TextEditingController(),
      _tecAddr1 = new TextEditingController(),
      _tecAddr2 = new TextEditingController(),
      _tecCity = new TextEditingController(),
      _tecPin = new TextEditingController();

  GlobalKey<FormState> form = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: ListView(
        padding: EdgeInsets.all(12),
        children: <Widget>[
          //First name
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              controller: _tecFirstName,
              decoration: InputDecoration(
                labelText: "Enter your first Name",
                helperText: "First Name",
              ),
              validator: (val) {
                if (val == null || val == "") {
                  return "Please Enter a value";
                } else if (val.contains(" ")) {
                  return "First names cannot have a space";
                } else {
                  return null;
                }
              },
            ),
          ),

          //Last name
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              controller: _tecLastName,
              decoration: InputDecoration(
                labelText: "Enter your last Name",
                helperText: "Last Name",
              ),
              validator: (val) {
                if (val == null || val == "") {
                  return "Please Enter a value";
                } else if (val.contains(" ")) {
                  return "Last names cannot have a space";
                } else {
                  return null;
                }
              },
            ),
          ),

          //Email
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              controller: _tecEmail,
              decoration: InputDecoration(
                labelText: "Enter your Email",
                helperText: "Email",
              ),
              validator: (val) {
                if (val == null || val == "") {
                  return "Please enter an Email";
                } else if (val.contains("@") == false || val.contains(".") == false) {
                  return "Please enter a valid email";
                } else {
                  return null;
                }
              },
            ),
          ),

          //Phone number
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              controller: _tecPhone,
              decoration: InputDecoration(
                labelText: "Enter your Phone",
                helperText: "Phone",
              ),
              validator: (val) {
                if (val == null || val == "") {
                  return "Please enter an Phone number";
                } else if (val.length < 9 || val.length > 12) {
                  return "Please enter a Phone number";
                } else if (int.tryParse(val) == null) {
                  return "Please enter a number";
                } else {
                  return null;
                }
              },
            ),
          ),

          //Address line 1
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              controller: _tecAddr1,
              decoration: InputDecoration(
                labelText: "Enter your Address line 1",
                helperText: "Address line 1",
              ),
            ),
          ),

          //Address line 2
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              controller: _tecAddr2,
              decoration: InputDecoration(
                labelText: "Enter your Address line 2",
                helperText: "Address line 2",
              ),
            ),
          ),

          //City
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              controller: _tecCity,
              decoration: InputDecoration(
                labelText: "Enter your City",
                helperText: "City",
              ),
            ),
          ),

          //Pin code
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              controller: _tecPin,
              decoration: InputDecoration(
                labelText: "Enter your Pin Code",
                helperText: "Pin Code",
              ),
            ),
          ),

          //Button Save
          RaisedButton(
            color: Colors.blue,
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if (form.currentState.validate()) {
                List<String> lstValues = new List();

                lstValues.add(_tecFirstName.text);
                lstValues.add(_tecLastName.text);
                lstValues.add(_tecEmail.text);
                lstValues.add(_tecPhone.text);
                lstValues.add(_tecAddr1.text);
                lstValues.add(_tecAddr2.text);
                lstValues.add(_tecCity.text);
                lstValues.add(_tecPin.text);

                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FormDisplay(lstValues)));
              } else {
                print("Not Validated!");
              }
            },
          ),
        ],
      ),
    );
  }
}
