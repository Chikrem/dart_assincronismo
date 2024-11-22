<<<<<<< HEAD
// Final Aula-1
=======
// Importa a biblioteca necessária para entrada e saída (I/O) no terminal.
>>>>>>> aula-2
import 'dart:io';

// Classe `TimeQuestions` para lidar com perguntas relacionadas ao tempo (horas, dia, ano).
class TimeQuestions {
  // Perguntas predefinidas.
  String hour = 'Que horas sao?';
  String day = 'Que dia e hoje?';
  String year = 'Em que ano estamos?';
  
  // Armazena a pergunta do usuário.
  String question;

  // Obtém a data e hora atuais.
  DateTime date = DateTime.now();

  // Prefixo usado nas mensagens do bot.
  String kakoBot = 'KakoBOT:\n';

  // Indicador para saber se a pergunta é sobre tempo.
  bool isThisATimeQuestion = false;

  // Construtor que inicializa a pergunta do usuário.
  TimeQuestions(this.question);

  // Método para verificar se a pergunta é sobre tempo.
  bool isThisTime() {
    // Verifica se a pergunta contém palavras-chave relacionadas ao tempo.
    if (question.contains('horas') ||
        question.contains('Horas') ||
        question.contains('dia') ||
        question.contains('Dia') ||
        question.contains('ano') ||
        question.contains('Ano')) {
      isThisATimeQuestion = true; // Marca como uma pergunta sobre tempo.
    }
    return isThisATimeQuestion; // Retorna o resultado.
  }

  // Método para responder perguntas sobre tempo.
  void timeQuestion() {
    if (question == hour) {
      // Responde com as horas e minutos atuais.
      String _botAnswer = kakoBot + ' Opa! são : ${date.hour} horas e ${date.minute} minutos!';
      print(_botAnswer);
    } else if (question == day) {
      // Responde com o dia atual.
      String _botAnswer = kakoBot + ' Opa! hoje é dia : ${date.day}';
      print(_botAnswer);
    } else if (question == year) {
      // Responde com o ano atual.
      String _botAnswer = kakoBot + ' Opa! estamos em : ${date.year}';
      print(_botAnswer);
    } else {
      // Se a pergunta não for clara, chama o método `unsure`.
      unsure();
    }
  }

  // Método para lidar com perguntas não claras.
  void unsure() {
    if (question.contains('horas') || question.contains('Horas')) {
      // Pergunta ao usuário se ele quer saber as horas.
      String _botQuestion = kakoBot + ' Não entendi, você quer saber das horas?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        // Responde com as horas se o usuário confirmar.
        String _botAnswer = kakoBot + ' Beleza, são : ${date.hour} horas e ${date.minute} minutos!';
        print(_botAnswer);
      } else {
        // Mensagem padrão caso o usuário negue.
        String _botAnswer = kakoBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    } else if (question.contains('dia') || question.contains('Dia')) {
      // Pergunta ao usuário se ele quer saber o dia.
      String _botQuestion = kakoBot + ' Não entendi, você quer saber que dia é hoje?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        // Responde com o dia se o usuário confirmar.
        String _botAnswer = kakoBot + ' Beleza, hoje é dia: ${date.day}';
        print(_botAnswer);
      } else {
        // Mensagem padrão caso o usuário negue.
        String _botAnswer = kakoBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    } else if (question.contains('ano') || question.contains('Ano')) {
      // Pergunta ao usuário se ele quer saber o ano.
      String _botQuestion = kakoBot + ' Não entendi, você quer saber em que ano estamos?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {
        // Responde com o ano atual e inclui uma brincadeira.
        String _botAnswer = kakoBot +
            ' Beleza, estamos no ano de 2077, a pandemia já está terminando... \n '
            'Brincadeirinha! estamos em : ${date.year}';
        print(_botAnswer);
      } else {
        // Mensagem padrão caso o usuário negue.
        String _botAnswer = kakoBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    }
  }
}
