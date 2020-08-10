import 'package:flutter/material.dart';

class CompletedTaskWidget extends StatefulWidget {
  final Function onChangeCount;


  CompletedTaskWidget(this.onChangeCount);

  @override
  _CompletedTaskWidgetState createState() => _CompletedTaskWidgetState();
}

class _CompletedTaskWidgetState extends State<CompletedTaskWidget>  with AutomaticKeepAliveClientMixin<CompletedTaskWidget> {

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: scaffoldKey,
      body: Card(
        child: Center(
          child: RaisedButton(
              child: Text("Complete Count"),
              onPressed: () {
                widget.onChangeCount(45);
              }),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}