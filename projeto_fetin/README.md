<div align="center">

# 💜 KEEP CLOSE

### 📍 O que importa para você, sempre por perto.

<img src="docs/readme/banner.gif" width="100%"/>

<br>

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![ESP32](https://img.shields.io/badge/ESP32-000000?style=for-the-badge&logo=espressif&logoColor=white)
![Bluetooth](https://img.shields.io/badge/BLE-7B2CBF?style=for-the-badge&logo=bluetooth&logoColor=white)

<br>

[![Typing SVG](https://readme-typing-svg.demolab.com?font=Fira+Code&size=20&pause=1000&color=8B5CF6&center=true&vCenter=true&width=600&lines=Stay+connected.;Stay+protected.;Keep+what+matters+close.)](https://git.io/typing-svg)

</div>

---

## 🔮 Sobre o projeto

O **KeepClose** é um sistema inteligente de proximidade desenvolvido para ajudar o usuário a manter seus objetos importantes sempre por perto.

O projeto utiliza uma **tag baseada em ESP32**, comunicação **Bluetooth Low Energy (BLE)** e um aplicativo desenvolvido em **Flutter**.

A tag pode ser associada a objetos como:

- 🎒 Mochila
- 🔑 Chaves
- 💻 Notebook
- 👜 Bolsa
- 🧳 Mala
- 📦 Outros objetos importantes

O smartphone monitora a conexão e a intensidade do sinal da tag. Quando o objeto começa a se afastar, o aplicativo pode identificar essa mudança e alertar o usuário.

> **Connect. Protect. Keep Close.**

---

## ⚡ Como funciona?

```mermaid
flowchart LR
    A[📍 Tag ESP32] -->|Bluetooth Low Energy| B[📱 KeepClose]
    B --> C[📡 Monitoramento do sinal]
    C --> D{Distância crítica?}
    D -->|Não| C
    D -->|Sim| E[🚨 Alerta no celular]
