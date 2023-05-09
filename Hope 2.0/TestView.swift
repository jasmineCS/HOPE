//
//  TestView.swift
//  Hope 2.0
//
//  Created by 90310470 on 5/2/23.
//


import SwiftUI

struct AddView: View {
    let newItem: Bool

    var body: some View {
        Text(String(newItem))
    }
}

struct TestView: View {
    @State private var showingAdd = false
    @State private var newItem = false
    @State private var otherItem = 0

    var body: some View {
        NavigationView {
            Form {
                Button("Add with true") {
                    newItem = true
                    otherItem += 1
                }
                Button("Add with false") {
                    newItem = false
                    otherItem += 1
                }
            }
            .onChange(of: otherItem) { _ in
                showingAdd = true
            }

            .sheet(isPresented: $showingAdd) {
                AddView(newItem: newItem)
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
