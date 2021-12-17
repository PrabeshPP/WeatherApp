import 'package:test/test.dart';
import 'package:weather/counter.dart';

void main() {
  group('Counter', () {
    test('Value Should Start at 0', () {
      final counter = Counter();
      expect(counter.value, 0);
    });

    test("Value should be incremented", () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });
    test("Value should be decremented", () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
      
    });
  });
}
