//Bai tap :GPT ax^ + bx + c = 0;
import 'dart:io';
import 'dart:math';

void main() {
  double a = 0, b = 0, c = 0;
  //input a
  do {
    stdout.write('Nhap he so a(a khac 0):');
    String? input = stdin.readLineSync();
    if (input != null) {
      a = double.tryParse(input) ?? 0;
    }
    if (a == 0) {
      print('Vui long nhap lai :');
    }
  } while (a == 0);
  //input b
  stdout.write('Nhap he so b:');
  String? inputB = stdin.readLineSync();
  if (inputB != null) {
    b = double.tryParse(inputB) ?? 0;
  }
  //Input c
  stdout.write('Nhap he so c:');
  String? inputC = stdin.readLineSync();
  if (inputC != null) {
    c = double.tryParse(inputC) ?? 0;
  }
  //Tinh delta
  double delta = b * b - 4 * a * c;
  print('Phuong trinh : ${a}x^2 +${b}x +$c = 0');
  //Gpt
  if (delta < 0) {
    print('Phuong trinh vo nghiem');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    x = double.parse(x.toStringAsFixed(2));
    print('Phuong trinh co nghiem kep x = $x');
  } else {
    double x1 = (-b + sqrt(delta) / (2 * a));
    double x2 = (-b - sqrt(delta)) / (2 * a);
    //Lam tron den 2 chu so thap phan
    x1 = double.parse(x1.toStringAsFixed(2));
    x1 = double.parse(x1.toStringAsFixed(2));
    print('Phuong trinh co 2 nghiem phan biet :');
    print('x1 = $x1');
    print('x2 = $x2');
  }
}
