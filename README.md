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
  - Criar notas diretamente via **Siri**, **Spotlight**, **Widgets** e integrações do iOS.
  - Intent principal: `EscreverNotaIntent`.
  
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

- iOS 26
- Dispositivo compatível com Apple Intelligence


