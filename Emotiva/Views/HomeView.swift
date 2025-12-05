//
//  DiarioView.swift
//  Emotiva
//
//  Created by Jonas Fernando Nascimento Melo on 04/12/25.
//

import SwiftUI
import AppIntents
import NaturalLanguage
internal import Combine

struct HomeView: View {
    @ObservedObject var viewModel: CoreDataViewModel
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.dNotes) { dNote in
                        DNoteContainer(viewModel: viewModel, dNote: dNote)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Emotiva")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "pencil.tip.crop.circle.badge.plus")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                DNoteSheet(viewModel: viewModel)
            }
            .refreshable {viewModel.getAll()}
            .onAppear{viewModel.getAll()}
            .onChange(of: showSheet) {viewModel.getAll()}
        }
    }
}

#Preview {
    @ObservedObject var viewModel = CoreDataViewModel()
    HomeView(viewModel: viewModel)
}
