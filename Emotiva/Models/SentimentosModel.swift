//
//  SentimentosModel.swift
//  Emotiva
//
//  Created by Jonas Fernando Nascimento Melo on 05/12/25.
//
import FoundationModels
import SwiftUI

struct SentimentosModel {
    static var shared = SentimentosModel()
    
    private init(){}
    
    mutating func foundationModel(_ text: String) async throws -> Double {
        guard !text.isEmpty else { return 0.0 }
        
        let instructions = "\(text). Return a number based on the text (Double type) between 1.0 and -1.0, where 1.0 is very happy and -1.0 is very sad.  "
        
        let session = LanguageModelSession(model: .default, instructions: instructions)
        do {
            let response = try await session.respond(to: instructions, generating: Double.self)
            
            return response.content
        } catch {
            print("Error: \(error.localizedDescription)")
            return 0.0
        }
    }
    
    func colorForScore(_ score: Double) -> Color {
        if score > 0.4 { return Color.orange }
        else if score > 0.1 { return Color.yellow }
        else if score < -0.4 { return Color.indigo }
        else if score < -0.1 { return Color.gray }
        return Color.mint
    }
    
    func emojiForScore(_ score: Double) -> String {
        if score > 0.5 { return "😁" }
        if score > 0.1 { return "🙂" }
        if score < -0.5 { return "😭" }
        if score < -0.1 { return "😔" }
        return "😐"
    }
}
