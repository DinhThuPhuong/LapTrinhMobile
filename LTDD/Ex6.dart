import 'dart:ffi';
import 'dart:io';
import 'dart:math';

void main() {
  int a = 0;
  do {
    stdout.write('Nhap so nguyen a:');
    String? input = stdin.readLineSync();
    if (input != null) {
      a = int.parse(input);
      if (a <= 0) {
        print('Vui long nhap lai so nguyen a :');
      }
    }
  } while (a == 0);
  //Chuyen doi thanh so nhi phan

  List<int> binary = [];
  while (a > 0) {
    binary.add(a % 2);

    a = a ~/ 2;
  }

  //In ket qua
  for (int i = binary.length - 1; i >= 0; i--) {
    stdout.write(binary[i]);
  }
}
