<div align="center">

# Emotiva

### Write how you feel. Let on-device intelligence read the mood. 💭

Emotiva is an emotional journal for iOS. Write a short note and Apple Intelligence scores
its sentiment right on the device, giving each entry a color and an emoji so you can see
how your days have felt — and you can log a note through Siri, Spotlight or Shortcuts
without even opening the app.

<br/>

[![Platform](https://img.shields.io/badge/iOS-26.0+-000000?style=for-the-badge&logo=apple&logoColor=white)](https://www.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5-FA7343?style=for-the-badge&logo=swift&logoColor=white)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-0052CC?style=for-the-badge&logo=swift&logoColor=white)](https://developer.apple.com/xcode/swiftui/)
[![Apple Intelligence](https://img.shields.io/badge/Apple_Intelligence-000000?style=for-the-badge&logo=apple&logoColor=white)](https://developer.apple.com/documentation/foundationmodels)
[![License](https://img.shields.io/badge/License-MIT-3DA639?style=for-the-badge)](LICENSE)

</div>

---

## 📑 Table of Contents

- [About](#-about)
- [Features](#-features)
- [How It Works](#-how-it-works)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Authors](#-authors)
- [License](#-license)

---

## 📖 About

Most journaling apps ask you to label your own mood. Emotiva does it for you: every note
is read by Apple's on-device foundation model, which returns a sentiment score from
**-1.0 (very sad)** to **1.0 (very happy)**. That score becomes the color and emoji of the
entry, turning your journal into a visual record of how you've been feeling.

Because the analysis runs on the device with the `FoundationModels` framework, your notes
never leave your iPhone.

---

## 🚀 Features

- **📝 Daily notes** — write a note in a quick sheet and save it to your journal.
- **🧠 On-device sentiment analysis** — Apple Intelligence scores each note between -1.0 and 1.0.
- **🎨 Mood colors & emoji** — each entry gets a color and an emoji that match its score.
- **🗣️ Siri, Spotlight & Shortcuts** — the `EscreverNotaIntent` App Intent lets you write a note by voice or from system search.
- **🔒 Private by design** — no server, no account; notes are stored locally with Core Data.

---

## ⚙️ How It Works

1. **Write a note** — in the app, or by saying *"Escrever no Emotiva"* to Siri.
2. **The note is scored** — a `LanguageModelSession` generates a `Double` between -1.0 and 1.0 for the text.
3. **The entry is saved** — text, date and score are persisted with Core Data.
4. **Your journal fills with color** — each entry is rendered with the color and emoji of its score.

Under the hood, `SentimentosModel` wraps the foundation model call and maps scores to
colors and emoji, `CoreDataController` owns the persistent container, and
`CoreDataViewModel` connects both to the SwiftUI views. The data model also links notes to
people (`Person`), laying the groundwork for tracking how relationships evolve.

---

## 🛠️ Tech Stack

| Area | Tech |
|------|------|
| UI | SwiftUI |
| On-device AI | FoundationModels (Apple Intelligence) |
| System integration | App Intents · App Shortcuts |
| Persistence | Core Data |
| Architecture | MVVM |

---

## 📂 Project Structure

```
Emotiva/
├── EmotivaApp.swift            # App entry
├── Models/                     # SentimentosModel, CoreDataController, App Intent + Shortcuts
├── ViewModel/                  # CoreDataViewModel
├── Views/                      # Home, note list and note creation sheet
├── Components/                 # Reusable note containers and mood backgrounds
└── Model.xcdatamodeld/         # DailyNotes and Person entities
```

---

## 🎯 Getting Started

### Requirements

- Xcode 26+
- iOS 26.0+
- An Apple Intelligence–compatible device (or Mac running the simulator) with Apple Intelligence turned on

### Run

```bash
git clone https://github.com/JonasFNMelo/Emotiva.git
cd Emotiva
open Emotiva.xcodeproj
```

Then pick a destination with Apple Intelligence available and run (`⌘R`).

---

## 👥 Authors

<table width="100%">
  <tr>
    <td align="center" width="100%">
      <a href="https://github.com/JonasFNMelo"><img src="https://github.com/JonasFNMelo.png" width="80" alt="Jonas Melo"/></a>
      <br/><sub><b>Jonas Melo</b></sub><br/>
      <a href="https://github.com/JonasFNMelo"><img src="https://skillicons.dev/icons?i=github" alt="GitHub"/></a>
      <a href="https://www.linkedin.com/in/jonas-melo-/"><img src="https://skillicons.dev/icons?i=linkedin" alt="LinkedIn"/></a>
    </td>
  </tr>
</table>

---

## 📄 License

Released under the [MIT License](LICENSE).
