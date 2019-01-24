import 'dart:async';
import 'dart:isolate';

doSomeNetworkCall() {
  var future = actualNetworkCall();
  future.then((id) {
    print("Id retreived $id");
    var dbFuture = dbCallSingleLine();
    dbFuture.then((id) => print("Saved with id $id"));
  });
}

Future<String> dbCallSingleLine() =>
    Future.delayed(Duration(seconds: 5), () => '3');

Future actualNetworkCall() {
  var completer = Completer<String>();
  Timer(Duration(seconds: 12), () {
    var id = 101;
    completer.complete(id.toString());
  });
  return completer.future;
}

//Dart has a single execution thread with Isolates that run in their own memory space.
//They don't share memory and you won't worry about concurrency issues
//Isolates can't talk directly but with the use of ports

Future generateMessage(SendPort sender) {
  sender.send("Some message that will be delivered async");
  return ReceivePort().first;
}

void main() {
  doSomeNetworkCall();

  var receivePort = ReceivePort();
  var isolate = Isolate.spawn(generateMessage, receivePort.sendPort);
  isolate.then((_) => receivePort.first).then((msg) {
    print("From other isolate : $msg");
  });
}
