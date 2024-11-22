import 'dart:math';

void main() {
  chat("João", "Maria")
      .then((value) => print('TOTAL DE TEMPO DO CHAT:\n$value'));
}

Future chat(String pessoa1, String pessoa2) async {
  DateTime dataInicioChat;
  DateTime dataFimChat;
  Random random = Random();
  int tempo;

  try {
    dataInicioChat = DateTime.now();
    print(
        '$pessoa1: Bom dia, grupo! ${dataInicioChat.hour}:${dataInicioChat.minute} e ${dataInicioChat.second}s');

    tempo = random.nextInt(5);
    await Future.delayed(Duration(seconds: tempo));
    print(
        '$pessoa2: Bom dia! Tudo bem? ${DateTime.now().hour}:${DateTime.now().minute} e ${DateTime.now().second}s');

    tempo = random.nextInt(5);
    await Future.delayed(Duration(seconds: tempo));
    print(
        '$pessoa1: Suave, e vc? ${DateTime.now().hour}:${DateTime.now().minute} e ${DateTime.now().second}s');
    tempo = random.nextInt(5);

    await Future.delayed(Duration(seconds: tempo));
    dataFimChat = DateTime.now();
    print(
        '$pessoa2: Certinho. ${dataFimChat.hour}:${dataFimChat.minute} e ${dataFimChat.second}s');

    Duration tempoChat = dataFimChat.difference(dataInicioChat);

    String totalTempo =
        "Horas:${tempoChat.inHours}\nMinutos:${tempoChat.inMinutes}\nSegundos:${tempoChat.inSeconds}";

    return totalTempo;
  } catch (e) {
    return "Analise o erro: $e";
  } finally {
    print('$pessoa2 Saiu do Grupo.');
  }
}