import 'dart:math';

List shuffle(List items) {
  var random = new Random();

  for (var i = 0; i < items.length; i++) {
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}
