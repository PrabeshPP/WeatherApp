import 'package:test/test.dart';
import 'package:weather/counter.dart';

void main() {
  test("Counter Value should be incremented", () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 1);
  });
}
