 import 'dart:math';


String generateCode([int length = 10]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-_';
    final random = Random.secure();
    final randomStr =  List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
    return randomStr;
}
