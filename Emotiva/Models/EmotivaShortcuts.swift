//
//  EmotivaShortcuts.swift
//  Emotiva
//
//  Created by Jonas Fernando Nascimento Melo on 05/12/25.
//
import AppIntents

struct EmotivaShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: EscreverNotaIntent(),
            phrases: [
                "Escrever no \(.applicationName)",
                "Nova nota no \(.applicationName)",
                "Registrar sentimento no \(.applicationName)"
            ],
            shortTitle: "Nova Nota Emotiva",
            systemImageName: "heart.text.square"
        )
    }
}
