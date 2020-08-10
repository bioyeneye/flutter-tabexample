import 'package:flutter/material.dart';

class OnGoingTaskWidget extends StatefulWidget {
  final Function onChangeCount;


  OnGoingTaskWidget(this.onChangeCount);

  @override
  _OnGoingTaskWidgetState createState() => _OnGoingTaskWidgetState();
}

class _OnGoingTaskWidgetState extends State<OnGoingTaskWidget>  with AutomaticKeepAliveClientMixin<OnGoingTaskWidget> {

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    //widget.onChangeCount(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: scaffoldKey,
      body: Card(
        child: Center(
          child: RaisedButton(
              child: Text("On-Going Count"),
              onPressed: () {
                widget.onChangeCount(34);
              }),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}