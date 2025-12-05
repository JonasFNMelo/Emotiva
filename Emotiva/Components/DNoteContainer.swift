//
//  DNoteContainer.swift
//  Emotiva
//
//  Created by Jonas Fernando Nascimento Melo on 05/12/25.
//

import SwiftUI

struct DNoteContainer: View {
    @ObservedObject var viewModel: CoreDataViewModel
    var dNote: DailyNotes
    
    var body: some View {
        ContainerStack(dNote: dNote){
            Capsule()
                .fill(viewModel.getColor(for: dNote.sentimentScore))
                .frame(width: 6)
                .shadow(color: viewModel.getColor(for: dNote.sentimentScore).opacity(0.5), radius: 4)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(dNote.text ?? "")
                    .font(.body)
                    .fontWeight(.medium)
                    .lineLimit(4)

                HStack {
                    Text(dNote.date?.formatted(date: .abbreviated, time: .shortened) ?? "")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(viewModel.getEmoji(for: dNote.sentimentScore))
                        .font(.caption)
                }
            }
            .padding(.vertical, 8)
        }
    }
}

