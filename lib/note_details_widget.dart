import 'package:first_flutter_app/DbManager.dart';
import 'package:flutter/material.dart';

class NoteDetailsWidget extends StatefulWidget {
  final DbManager _dbManager;

  NoteDetailsWidget(this._dbManager);

  @override
  NoteDetailsWidgetState createState() => NoteDetailsWidgetState(_dbManager);
}

class NoteDetailsWidgetState extends State<NoteDetailsWidget> {
  final _formKey = new GlobalKey<FormState>();

  String _title;
  String _desc;

  final DbManager _dbManager;

  NoteDetailsWidgetState(this._dbManager);

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _dbManager
          .insertNote(new Note(title: _title, description: _desc))
          .then((id) => Navigator.pop(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Edit note data"),
      ),
      body: new Form(
        key: _formKey,
        child: new Container(
          margin: new EdgeInsets.all(16.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                child: new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Title",
                    border: InputBorder.none,
                  ),
                  validator: (val) =>
                      val.isNotEmpty ? null : "Title must not be empty",
                  onSaved: (val) => _title = val,
                ),
              ),
              new Container(
                child: new Divider(
                  color: Colors.black,
                ),
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Description",
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                validator: (val) =>
                    val.isNotEmpty ? null : "Description must not be empty",
                onSaved: (val) => _desc = val,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _submit,
        child: new Icon(Icons.check),
      ),
    );
  }
}
