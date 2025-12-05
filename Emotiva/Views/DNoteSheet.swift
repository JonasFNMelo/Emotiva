//
//  DNoteSheet.swift
//  Emotiva
//
//  Created by Jonas Fernando Nascimento Melo on 05/12/25.
//
import SwiftUI

struct DNoteSheet: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: CoreDataViewModel
    
    @State private var text: String = ""
    @State private var text2: String = "Toque Aqui"
    @State private var currentScore: Double = 0.0
    
    var body: some View {
        ColoredBackground(score: currentScore) {
            VStack {
                HStack {
                    Button("Cancelar") { dismiss() }
                    Spacer()
                    Text(viewModel.getEmoji(for: currentScore))
                        .font(.largeTitle)
                        .animation(.spring(), value: currentScore)
                    Spacer()
                    Button("Salvar") {
                        Task{
                            currentScore = try await SentimentosModel.shared.foundationModel(text)
                            try await viewModel.createDNote(text: text, score: currentScore, people: [])
                            dismiss()
                        }
                    }
                    .fontWeight(.bold)
                    .disabled(text.isEmpty)
                }
                .padding()
                ZStack{
                    if text == ""{
                        Text(text2)
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    TextEditor(text: $text)
                        .font(.title2)
                        .scrollContentBackground(.hidden)
                        .padding()
                        .onChange(of: text) { value in
                            Task {
                                do {
                                    // primeiro aguarda o resultado (async)
                                    let score = try await SentimentosModel.shared.foundationModel(value)
                                    // depois atualiza o state de forma síncrona com animação
                                    withAnimation {
                                        currentScore = score
                                    }
                                } catch {
                                    print("Erro ao analisar texto: \(error)")
                                }
                            }
                        }
                }
                
                Spacer()
                
                Text("A IA está sentindo sua emoção...")
                    .foregroundColor(.secondary)
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    @ObservedObject var viewModel = CoreDataViewModel()
    DNoteSheet(viewModel: viewModel)
}
