import 'dart:io';
import 'dart:math';

void main() {
  print('Добро пожаловать в игру "Загадай и Угадай число"!');
  print(
      'Выберите режим игры\n1 - Я угадываю\n2 - Комп угадывает\n3 - Соревнование');
  String choose = stdin.readLineSync()!;
  if (choose == '1') {
    game();
  } else if (choose == '2') {
    game2();
  } else if (choose == '3') {
    game3();
  }
}

void game() {
  print('Компьютер загадал число от 1 до 100, попробуй его отгадать');
  int counter = 0;
  int randomNumber = Random().nextInt(100) + 1;
  int number = 0;

  while (randomNumber != number) {
    print(counter);
    counter++;
    number = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    if (counter <= 7) {
      if (randomNumber == number) {
        print('Вы угадали! и количество попыток: $counter');
        break;
      } else if (randomNumber > number) {
        print('число больше');
      } else if (randomNumber < number) {
        print('число меньше');
      }
    } else {
      print('Вы проиграли! и количество попыток: $counter');
      break;
    }
  }
}

void game2() {
  print('Загадайте число от 1 до 100, а комп попробует его угадать.');

  int min = 1;
  int max = 100;
  bool guessed = false;
  int attempts = 0;

  while (!guessed) {
    //int guess = Random().nextInt(max - min + 1) + min;
    int guess = ((max - min) / 2).ceil() + min;
    attempts++;
    print(attempts);

    print('Это число $guess?');
    print('1. Меньше');
    print('2. Больше');
    print('3. Верно');

    int response = int.tryParse(stdin.readLineSync()!) ?? 0;

    if (attempts <= 7) {
      if (response == 1) {
        print(max = guess - 1);
      } else if (response == 2) {
        print(min = guess + 1);
      } else if (response == 3) {
        print('комп угадал число $guess. Количество попыток: $attempts.');
        guessed = true;
        break;
      }
    } else {
      print('Всё! Комп не смог угадать и проиграл, а вы выиграли');
      break;
    }
  }
}

void game3() {
  print("Добро пожаловать в игру по очереди!");

  int numRounds = 3; // Количество раундов по умолчанию

  print(
      "Введите количество раундов (от 1 до 10) или нажмите Enter для выбора значения по умолчанию:");
  String input = stdin.readLineSync()!;

  if (input.isNotEmpty) {
    numRounds = int.parse(input);
    if (numRounds < 1 || numRounds > 10) {
      print(
          "Неверное количество раундов. Будет использовано значение по умолчанию: 3");
      numRounds = 3;
    }
  }

  int counter = 0;
  counter++;
  int attempts = 0;
  attempts++;

  for (int round = 1; round <= numRounds; round++) {
    print("====================");
    print("Раунд $round:");
// 1
    print('Компьютер загадал число от 1 до 100, попробуй его угадать');
    int counter = 0;
    int randomNumber = Random().nextInt(100) + 1;
    int number = 0;

    while (randomNumber != number) {
      print(counter);
      counter++;
      number = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

      if (counter <= 7) {
        if (randomNumber == number) {
          print('Вы угадали! и количество попыток: $counter');
          break;
        } else if (randomNumber > number) {
          print('число больше');
        } else if (randomNumber < number) {
          print('число меньше');
        }
      } else {
        print('Вы проиграли!');
        break;
      }
    }

// 2
    print('Теперь очередь компа угадывать');
    print('Загадайте число от 1 до 100, а комп попробует его угадать.');

    int min = 1;
    int max = 100;
    bool guessed = false;
    int attempts = 0;

    while (!guessed) {
      //int guess = Random().nextInt(max - min + 1) + min;
      int guess = ((max - min) / 2).ceil() + min;
      attempts++;
      print(attempts);

      print('Это число $guess?');
      print('1. Меньше');
      print('2. Больше');
      print('3. Верно');

      int response = int.tryParse(stdin.readLineSync()!) ?? 0;

      if (attempts <= 7) {
        if (response == 1) {
          print(max = guess - 1);
        } else if (response == 2) {
          print(min = guess + 1);
        } else if (response == 3) {
          print('комп угадал число $guess. Количество попыток: $attempts.');
          guessed = true;
          break;
        }
      } else {
        print('Всё! Комп не смог угадать и проиграл, а вы выиграли');
        break;
      }
    }
    print('Пользователь: $counter');
    print('Компьютер: $attempts');
    if (attempts > counter) {
      print('Пользователь выиграл!');
    } else {
      print('Компьютер выиграл!');
    }
  }
}
