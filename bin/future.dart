void main() {
  // Criando um Future de forma direta, sem usar async/await
  // Future myFuture = Future(() {
  //   print('Going back to the Future');
  //   return 21;  // Retorna um valor de 21, que será passado para o callback 'then'
  // }).then((value) => print('The value is $value'));  // O método 'then' é chamado quando o Future é resolvido

  // Definindo uma função assíncrona que retorna um Future com valor inteiro
  // Future<int> myFutureFunc() async {
  //   print('I have a function in the Future');
  //   await Future.delayed(Duration(seconds: 5));  // Simula uma operação assíncrona que leva 5 segundos
  //   throw Exception();
  //   return 12;  // Retorna o valor 12 após o delay
  // }

  // Chamando a função assíncrona 'myFutureFunc' e tratando seu retorno com 'then'
    // myFutureFunc()
    //     .then((value) =>print('My function value is: $value'))
    //     .onError((error, stackTrace) => print('An Error occurred'))
    //     .whenComplete(() => print('The Future is Over'));

  Future<int> myFutureErrorFunc(int a, int b) async {
    try{
      if(b>a){
        throw Exception();
      }
      print('I am a Functional Function');

      await Future.delayed(Duration(seconds: 5));
      return 42;

    }catch(e){
      print('An Error occurred: $e');
      return 42;

    }finally{
      print('The Future is finally Over');
    }

    }

  myFutureErrorFunc(2, 1).then((value) => print('The value is: $value'));

  print('Done with main');

}
