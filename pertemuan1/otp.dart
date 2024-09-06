import 'dart:math';

class OTP {
  static String generateKey(int length) {
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Random random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  static String encrypt(String plaintext, String key) {
    String result = '';
    for (int i = 0; i < plaintext.length; i++) {
      int p = plaintext[i].toUpperCase().codeUnitAt(0) - 65;
      int k = key[i].codeUnitAt(0) - 65;
      int c = (p + k) % 26;
      result += String.fromCharCode(c + 65);
    }
    return result;
  }

  static String decrypt(String ciphertext, String key) {
    String result = '';
    for (int i = 0; i < ciphertext.length; i++) {
      int c = ciphertext[i].codeUnitAt(0) - 65;
      int k = key[i].codeUnitAt(0) - 65;
      int p = (c - k + 26) % 26;
      result += String.fromCharCode(p + 65);
    }
    return result;
  }
}

void main() {
  // masukkan plaintext disini
  String plaintext = 'JEHIAN';
  
  // hapus spasi & ubah menjadi huruf kapital
  plaintext = plaintext.replaceAll(' ', '').toUpperCase();
  
  // dapetin key random
  String key = OTP.generateKey(plaintext.length);
  
  // enkripsi
  String ciphertext = OTP.encrypt(plaintext, key);
  
  // output hasil enkripsi
  print('Enkripsi:');
  print('Plaintext: $plaintext');
  print('Key: $key');
  print('Ciphertext: $ciphertext');
  
  // dekripsi
  String decrypted = OTP.decrypt(ciphertext, key);
  
  // output hasil dekripsi
  print('\nDekripsi:');
  print('Ciphertext: $ciphertext');
  print('Key: $key');
  print('Decrypted text: $decrypted');
}