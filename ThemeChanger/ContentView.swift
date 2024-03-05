//
//  ContentView.swift
//  ThemeChanger
//
//  Created by Ajay Boda on 05/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var changeTheme: Bool = false
    @Environment(\.colorScheme) var scheme
    @AppStorage("user_theme") private var userTheme: Theme = .systemDefault

    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Button("Change Theme") {
                        changeTheme.toggle()
                    }
                }
            }
            .navigationTitle("Settings")
        }
        
        .preferredColorScheme(userTheme.colorScheme)
        .sheet(isPresented: $changeTheme) {
            ThemeChangerView(scheme: scheme)
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        }
    }
}

#Preview {
    ContentView()
}
