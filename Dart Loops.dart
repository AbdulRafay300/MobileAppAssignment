import 'dart:io';

void main() {
  stdout.write("Enter a number (n): ");
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= n; i++) {
    String row = "";
    for (int j = 1; j <= i; j++) {
      row += "$j ";
    }
    print(row.trim());
  }
}
