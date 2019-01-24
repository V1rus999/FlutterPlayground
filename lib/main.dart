import 'package:first_flutter_app/DbManager.dart';
import 'package:first_flutter_app/note_details_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          accentColor: Colors.amber),
      home: new NotesList(),
    );
  }
}

class NotesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NotesListState();
  }
}

class NotesListState extends State<NotesList> {
  final DbManager _dbManager = new DbManager();
  List<Note> notes;

  Widget buildNotesList(AsyncSnapshot<List<Note>> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return null;
      case ConnectionState.waiting:
        return new CircularProgressIndicator();
      default:
        if (snapshot.hasError) {
          return new Text("Unexpected Error ${snapshot.error}");
        }
        notes = snapshot.data;
        return new ListView.builder(
            itemBuilder: (_, index) => _createItem(index),
            itemCount: notes.length);
    }
  }

  Widget _createItem(int index) {
    return new ListTile(
      title: new Text(notes[index].title),
      subtitle: new Text(notes[index].description),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _dbManager.closeDb();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Note>>(
        future: _dbManager.getNotes(),
        builder: (context, snapshot) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Notepad"),
            ),
            body: buildNotesList(snapshot),
            floatingActionButton: new FloatingActionButton(
                onPressed: () => Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (_) => new NoteDetailsWidget(_dbManager))),
                child: new Icon(Icons.add)),
          );
        });
  }
}
