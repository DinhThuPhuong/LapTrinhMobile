import 'dart:io';
import 'dart:math';

void main() {
  int a = 0;
  //Nhap gia tri cho a
  do {
    stdout.write('Nhap so nguyen a:');
    String? input = stdin.readLineSync();
    if (input != null) {
      a = int.parse(input);
      if (a <= 1) {
        print('Vui long nhap lai so nguyen a :');
      }
    }
  } while (a == 0);
  //Tinh tong uoc so cua a
  int sum = 0;
  for (int i = 1; i <= a.abs(); i++) {
    if (a % i == 0) {
      sum += i;
    }
  }
  print('Tong cac uoc so của $a = $sum');
}
