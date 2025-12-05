//
//  ContainerStack.swift
//  Emotiva
//
//  Created by Jonas Fernando Nascimento Melo on 05/12/25.
//

import SwiftUI
import Foundation

struct ContainerStack<Content: View>: View {
    @ObservedObject var viewModel = CoreDataViewModel()
    var dNote: DailyNotes
    let content: Content
    @State var isDeleted: Bool = false
    @State var offset: CGSize = .zero
    
    init(dNote: DailyNotes, @ViewBuilder content: () -> Content){
        self.dNote = dNote
        self.content = content()
    }
    
    var body: some View {
        if isDeleted == false {
            ZStack{
                HStack{
                    Spacer()
                    
                    Button {
                        viewModel.deleteDNote(dNote)
                        offset = .zero
                        isDeleted = true
                        print(isDeleted)
                    } label: {
                        Image(systemName: "trash.fill")
                            .font(.title)
                            .foregroundStyle(.red)
                    }
                    .padding(.horizontal, -25)
                }
                .padding(.horizontal)
                
                
                ZStack{
                    HStack(spacing: 16){
                        content
                    }
                    .padding(.horizontal)
                    .background(Color(.secondarySystemBackground).opacity(1))
                    .cornerRadius(12)
                    .transition(.scale.combined(with: .opacity))
                    .gesture(SwipeGesture)
                }
                .offset(offset)
                
            }
            .padding(.horizontal, 16)
        }
    }
    
    var SwipeGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                self.offset.width = value.translation.width
            }
            .onEnded { value in
                if value.translation.width < -50 {
                    self.offset.width = -50
                } else {
                    self.offset = .zero
                }
            }
    }
}
