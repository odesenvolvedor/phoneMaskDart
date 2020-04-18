main() {
  print(phoneMask('6'));
  print(phoneMask('62'));
  print(phoneMask('629'));
  print(phoneMask('6292'));
  print(phoneMask('62920'));
  print(phoneMask('629205'));
  print(phoneMask('6292056'));
  print(phoneMask('62920565'));
  print(phoneMask('629205658'));
  print(phoneMask('6292056586'));
  //mask with the ninth digit added
  print(phoneMask('62992056586'));
}

String phoneMask(String phone) {
  String onlyNumbers = phone.replaceAll(RegExp(r'[\Dg]'), "");
  onlyNumbers = onlyNumbers.replaceAll(RegExp(r'^0'), "");
  print(onlyNumbers.length);
  if (onlyNumbers.length > 10) {
      onlyNumbers = onlyNumbers.replaceAllMapped(RegExp(r'^(.{2})(.{0,5})(.{0,4}).*'), (Match m) => "(${m[1]}) ${m[2]}-${m[3]}" );
  } else if (onlyNumbers.length > 6) {
      onlyNumbers = onlyNumbers.replaceAllMapped(RegExp(r'^(.{2})(.{0,4})(.{0,4}).*'), (Match m) => "(${m[1]}) ${m[2]}-${m[3]}" );
  } else if (onlyNumbers.length > 2) {
    onlyNumbers = onlyNumbers.replaceAllMapped(RegExp(r'^(.{2})(.{0,4}).*'), (Match m) => "(${m[1]}) ${m[2]}" );
  } else {
    onlyNumbers = onlyNumbers.replaceAllMapped(RegExp(r'^(.{0,2}).*'), (Match m) => "(${m[0]})" );
  }
  return onlyNumbers;
}
