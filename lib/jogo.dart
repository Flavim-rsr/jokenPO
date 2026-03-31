import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  AssetImage _imagemApp = const AssetImage("assets/padrao.png");
  String _resultadoFinal = "Boa Sorte!!";
  Color _corResultado = Colors.black;

  int _pontosUsuario = 0;
  int _pontosApp = 0;
  int _empates = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("escolha do app: $escolhaApp");
    print("escolha do usuario: $escolhaUsuario");

    switch (escolhaApp) {
      case "pedra":
        _imagemApp = const AssetImage("assets/pedra.png");
        break;
      case "papel":
        _imagemApp = const AssetImage("assets/papel.png");
        break;
      case "tesoura":
        _imagemApp = const AssetImage("assets/tesoura.png");
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _resultadoFinal = "Parabéns!!! Você ganhou :)";
        _corResultado = Colors.blue;
        _pontosUsuario++;
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        _resultadoFinal = "Puxa!!! Você perdeu :(";
        _corResultado = Colors.red;
        _pontosApp++;
      });
    } else {
      setState(() {
        _resultadoFinal = "Empate!!! Tente novamente :/";
        _corResultado = Colors.amber;
        _empates++;
      });
    }
  }

  void _reiniciarJogo() {
    setState(() {
      _imagemApp = const AssetImage("assets/padrao.png");
      _resultadoFinal = "Boa Sorte!!";
      _corResultado = Colors.black;
      _pontosUsuario = 0;
      _pontosApp = 0;
      _empates = 0;
    });
  }

  Widget _opcaoJogo(String nome, String caminhoImagem) {
    return GestureDetector(
      onTap: () => _opcaoSelecionada(nome.toLowerCase()),
      child: Column(
        children: [
          Image.asset(
            caminhoImagem,
            height: 100,
          ),
          const SizedBox(height: 8),
          Text(
            nome,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('JokenPO'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16),
              const Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Image(
                image: _imagemApp,
                height: 120,
              ),
              const SizedBox(height: 32),
              const Text(
                "Escolha uma opção abaixo",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _opcaoJogo("Pedra", "assets/pedra.png"),
                  _opcaoJogo("Papel", "assets/papel.png"),
                  _opcaoJogo("Tesoura", "assets/tesoura.png"),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                _resultadoFinal,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: _corResultado,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Placar",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Você: $_pontosUsuario",
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                "App: $_pontosApp",
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                "Empates: $_empates",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _reiniciarJogo,
                child: const Text("Reiniciar jogo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
