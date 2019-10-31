import 'dart:async';
import 'sclae_event.dart';

class ScaleBloc {
  double _scale = 1.0;

  final _scaleStateController = StreamController<double>();

  StreamSink<double> get _inScale => _scaleStateController.sink;
  Stream<double> get scale => _scaleStateController.stream;

  final _scaleEventController = StreamController<ScaleEvent>();
  StreamSink<ScaleEvent> get scaleEventSink => _scaleEventController.sink;

  ScaleBloc() {
    _scaleEventController.stream.listen(_mapEvenetToState);
  }

  void _mapEvenetToState(ScaleEvent event) {
    if (event is ExpandEevent) {
      if (_scale != 7.0) _scale = _scale + 1.0;
    } else {
      if (_scale != 1.0) _scale = _scale - 1.0;
    }

    _inScale.add(_scale);
  }

  void dispose() {
    _scaleStateController.close();
    _scaleEventController.close();
  }
}
