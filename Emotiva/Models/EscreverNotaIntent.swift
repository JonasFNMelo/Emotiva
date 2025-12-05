//
//  EscreverNotaIntent.swift
//  Emotiva
//
//  Created by Jonas Fernando Nascimento Melo on 05/12/25.
//
import AppIntents

struct EscreverNotaIntent: AppIntent {
    var viewModel = CoreDataViewModel()
    static var title: LocalizedStringResource = "Escrever no Emotiva"
    static var description = IntentDescription("Analisa o sentimento e salva uma nota no Emotiva.")
    
    @Parameter(title: "Nota")
    var text: String
    
    func perform() async throws -> some IntentResult & ReturnsValue<String> {
        // Acesso ao MainActor para atualizar a UI thread-safe
        do{
            try await viewModel.createDNote(text: text, people: [])
        }
        catch{
            print(error.localizedDescription)
        }
        return .result(value: "Nota salva! Senti que isso foi importante.")
    }
}
