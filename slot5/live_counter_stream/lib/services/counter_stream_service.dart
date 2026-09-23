import 'dart:async';

class CounterStreamService {
  final StreamController<int> _counterController =
      StreamController<int>.broadcast();

  final StreamController<String> _statusController =
      StreamController<String>.broadcast();

  int _counter = 0;
  Timer? _timer;

  Stream<int> get counterStream => _counterController.stream;

  Stream<String> get statusStream => _statusController.stream;

  void start() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _counter++;

      print('Emit counter: $_counter');
      _counterController.add(_counter);

      final status = _counter.isEven ? 'Even' : 'Odd';

      print('Emit status: $status');
      _statusController.add(status);
    });
  }

  void pause() {
    _timer?.cancel();
    _timer = null;

    print('Stream Paused');
  }

  void resume() {
    print('Stream Resumed');
    start();
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;

    _counterController.close();
    _statusController.close();
  }
}
