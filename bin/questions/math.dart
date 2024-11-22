import 'dart:io';

class MathQuestion{
  String whatQuestion = 'voce sabe matematica?';
  String question;   // Question recebe o valor do usuario la no kakobot pelo contrutor
  String kakoBot = 'KakoBOT:\n';
  bool isMathQuestion = false;
 

  MathQuestion(this.question);  // construtor que vai receber o valor do usuario

  bool isMathFunc(){
    //verificar se estamos numa pergunta sobre o time que o robo torce
    if (question.contains('sabe') || question.contains('matematica')) {
      isMathQuestion = true;
    }
    return isMathQuestion;
  }

void whatCanQuestion() {
  if (question == whatQuestion) {
    // Mensagem inicial
    String _botAnswer = kakoBot +
        ' Eu sei fazer cálculos básicos, insira o primeiro e segundo número que deseja utilizar. Em seguida, digite o tipo de operação: Sum, Sub, Mult ou Div... ';
    print(_botAnswer);

    // Primeiro número
    print('Digite o primeiro número:');
    String? inputNumero1 = stdin.readLineSync(); // Captura entrada como String? (pode ser null)
    if (inputNumero1 == null || inputNumero1.isEmpty) {
      print('Entrada inválida para o primeiro número.');
      return; // Sai da função se a entrada for inválida
    }
    int numero1 = int.parse(inputNumero1); // Converte para int

    // Segundo número
    print('Digite o segundo número:');
    String? inputNumero2 = stdin.readLineSync();
    if (inputNumero2 == null || inputNumero2.isEmpty) {
      print('Entrada inválida para o segundo número.');
      return;
    }
    int numero2 = int.parse(inputNumero2);

    // Operação
    print('Digite o tipo de operação:');
    String? inputOperacao = stdin.readLineSync();
    if (inputOperacao == null || inputOperacao.isEmpty) {
      print('Entrada inválida para o tipo de operação.');
      return;
    }

    String operacaoUsuario = inputOperacao; // Agora temos certeza de que não é null

    // Verifica a operação e realiza o cálculo
    if (operacaoUsuario == 'Sum') {
      print('Resultado: ${numero1 + numero2}');
    } else if (operacaoUsuario == 'Sub') {
      print('Resultado: ${numero1 - numero2}');
    } else if (operacaoUsuario == 'Mult') {
      print('Resultado: ${numero1 * numero2}');
    } else if (operacaoUsuario == 'Div') {
      if (numero2 != 0) {
        print('Resultado: ${numero1 / numero2}');
      } else {
        print('Erro: Divisão por zero não é permitida.');
      }
    } else {
      print('Operação não reconhecida.');
      unsure(); // Chama a função `unsure()` se for uma operação desconhecida
    }
    print("Precisa de mais algo?");
  }
}


  unsure() {
    if (question.contains('calcular') || question.contains('sabe') || question.contains('matematica')) {

      String _botQuestion =
          kakoBot + ' Não entendi, você quer saber se consigo calcular?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {

        String _botAnswer = kakoBot + ' Entendi, Eu sei fazer cálculos básicos, insira o primeiro e segundo número que deseja utilizar. Em seguida, digite o tipo de operação: Sum, Sub, Mult ou Div... ';
        print(_botAnswer);
      } else {
        String _botAnswer = kakoBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    }
  }
}