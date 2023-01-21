//goofy ahh unit test :D

import 'package:test/test.dart';
class Counter{
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}
void main(){
  test('Counter value should be incremented', () {
   final  counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
}
