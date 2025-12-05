//
//  ContentView.swift
//  Emotiva
//
//  Created by Jonas Fernando Nascimento Melo on 04/12/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = CoreDataViewModel()
    
    var body: some View {
        HomeView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
