import 'package:flutter/material.dart';

class FormDisplay extends StatelessWidget {
  List lstForm;

  FormDisplay(this.lstForm);

  @override
  Widget build(BuildContext context) {
    print(lstForm);

    return Scaffold(
      appBar: AppBar(
        title: Text("Form Display"),
      ),
      body: ListView.builder(
        itemCount: lstForm.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                (index + 1).toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(lstForm[index]),
          );
        },
      ),
    );
  }
}
