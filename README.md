# Emotiva

Emotiva é um aplicativo iOS focado em **registro emocional**, **análise de sentimentos** e **rastreamento da evolução de relacionamentos**, combinando uma interface simples com integração ao **Apple Intelligence** e ao **App Intents** para automações.

---

## Funcionalidades

- **Registrar notas emocionais**
  - Usuário escreve uma nota, que é analisada pelo modelo de sentimentos.
  - O app armazena a nota no Core Data junto com o sentimento classificado.

- **Análise automática de sentimento**
  - Utiliza `FoundationModels` para interpretar as emoções presentes no texto.
  - Atribui cores e categorias emocionais às notas.

- **Integração com App Intents**
  - Criar notas diretamente pela **Siri**, pelo **Spotlight** e pelo app **Atalhos**, via `AppShortcutsProvider`.
  - Intent principal: `EscreverNotaIntent`.

> 📸 _Screenshots em breve._

---

## O que este projeto demonstra

- **Apple Intelligence on-device** com o framework `FoundationModels` (`LanguageModelSession`) para classificar o sentimento de um texto, sem enviar dados para servidores
- **App Intents** e **App Shortcuts**: a principal ação do app fica disponível fora dele, por voz e busca do sistema
- **Core Data** para persistir as notas junto com a classificação
- **MVVM**: Views, ViewModel e Models em pastas separadas, com componentes visuais reutilizáveis em `Components/`

---

## Estrutura do Projeto

```
Emotiva/
├── EmotivaApp.swift            # Entry point do app
│
├── Models/
│   ├── SentimentosModel.swift  # Estruturas de sentimentos
│   ├── CoreDataController.swift# Configuração Core Data
│   └── EscreverNotaIntent.swift# Intent principal
│
├── ViewModel/
│   └── CoreDataViewModel.swift # Acesso e lógica de dados
│
├── Views/
│   ├── HomeView.swift
│   ├── ContentView.swift
│   └── DNoteSheet.swift        # Tela de criação de notas
│
├── Components/
│   ├── ContainerStack.swift
│   ├── ColoredBackground.swift
│   └── DNoteContainer.swift
│
└── Model.xcdatamodeld/         # Estrutura Core Data
```

---

## Requisitos

- Xcode 26 ou superior
- iOS 26 ou superior
- Dispositivo compatível com Apple Intelligence, com o recurso ativado

## Como rodar

1. Clone o repositório:
   ```bash
   git clone https://github.com/JonasFNMelo/Emotiva.git
   ```
2. Abra `Emotiva.xcodeproj` no Xcode.
3. Execute (`⌘R`) em um dispositivo ou simulador com Apple Intelligence disponível.

## Autor

- [**Jonas Melo**](https://github.com/JonasFNMelo)

