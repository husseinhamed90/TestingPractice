import 'package:flutter_test/flutter_test.dart';
import 'package:testing/counter.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });

  test('Counter value should be decremented', () {
    final counter = Counter();

    counter.decrement();

    expect(counter.value, -1);
  });

  test('Counter value should be Zero', () {
    final counter = Counter();

    counter.reset();

    expect(counter.value, 0);
  });
}