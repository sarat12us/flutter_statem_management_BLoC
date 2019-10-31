import 'package:flutter/material.dart';
import 'package:flutter_state_management_bloc/scale_bloc.dart';
import 'package:flutter_state_management_bloc/sclae_event.dart';

class ExpandedCircle extends StatelessWidget {
  final _bloc = ScaleBloc();
  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('Expanded Circle'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                child: StreamBuilder(
                  stream: _bloc.scale,
                  initialData: 1.0,
                  builder: (BuildContext context, AsyncSnapshot<double> snapshot){
                      return Transform.scale(
                          scale: snapshot.data,
                          child: FloatingActionButton(onPressed: () {}, child: Text('BLoC'),),
                    );
                  },
                ),
            ),
            SizedBox(height: 250.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Expand'),
                    onPressed: () => _bloc.scaleEventSink.add(ExpandEevent()),
                  ),
                  SizedBox(width: 20.0),
                  RaisedButton(
                    child: Text('Shrink'),
                    onPressed: () => _bloc.scaleEventSink.add(ShrinkEevent()),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
}


