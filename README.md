# 🎮 JokenPO - Flutter

Aplicativo simples desenvolvido em Flutter que implementa o clássico jogo **Pedra, Papel e Tesoura (JokenPO)**.

O projeto tem como objetivo praticar conceitos fundamentais do Flutter como **gerenciamento de estado, interação com o usuário e construção de interface**.

---

## 📱 Preview

<!-- Você pode adicionar um GIF ou imagem aqui -->
<!-- ![preview](assets/preview.gif) -->

---

## 🎯 Objetivo

Este projeto foi desenvolvido com foco em aprendizado e prática de:

- Manipulação de estado com `setState`
- Eventos de clique (`GestureDetector`)
- Organização de widgets (Row, Column, Padding)
- Lógica de programação aplicada (condições e regras do jogo)
- Melhoria de experiência do usuário (UX)

---

## ⚙️ Funcionalidades

- Escolha entre:
  - Pedra
  - Papel
  - Tesoura
- Escolha aleatória do aplicativo
- Exibição visual da escolha do app
- Resultado da partida:
  - Vitória
  - Derrota
  - Empate
- Sistema de cores:
  - 🔵 Azul → Vitória
  - 🔴 Vermelho → Derrota
  - 🟡 Amarelo → Empate
- Sistema de pontuação:
  - Contador de vitórias do jogador
  - Contador de vitórias do app
  - Contador de empates
- Botão para reiniciar o jogo e o placar

---

## 🧠 Lógica do jogo

A lógica segue as regras clássicas:

- Pedra vence Tesoura
- Tesoura vence Papel
- Papel vence Pedra

O app gera uma escolha aleatória usando:

```dart
Random().nextInt(3);
```

---

## 📁 Versionamento e Gitignore

Este projeto utiliza um arquivo `.gitignore` adequado para aplicações Flutter, garantindo que arquivos desnecessários ou sensíveis não sejam versionados, como:

- Arquivos de build
- Configurações locais de IDE (VSCode, Android Studio)
- Dependências geradas automaticamente
- Arquivos de sistema operacional

Isso mantém o repositório mais limpo e organizado, facilitando a colaboração e o versionamento do código.