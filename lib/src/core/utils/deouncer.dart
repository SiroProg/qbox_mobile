import 'dart:async';

class Debouncer {
  Timer? _timer;
  final Duration duration;

  Debouncer(this.duration);

  void call(void Function() onChange) {
    _timer ??= Timer(duration, () {
      _timer?.cancel();
      _timer = null;

      onChange();
    });
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
