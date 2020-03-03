import 'dart:io';

void main() {
  List<int> lName = [1, 2, 3, 4, 2, 5, 6, 4];
  var name = {2: 'sfsdf'};
  int kk = int.parse('5');

  print('kk $kk');
  kk = stdin.readByteSync();
  print('kk $kk');

  // stdout.writeln('''
  // dkndw
  // 'lkmwlkm'
  // $lName
  // lkmlwmlwm;
  // 4''');

  // assert(lName == 58);

  // print(lName ??= 'krish');
  print(name[2]);
}
