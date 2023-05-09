//
//  ClothesView.swift
//  Hope 2.0
//
//  Created by 90310470 on 4/9/23.
//

import SwiftUI

struct Task1: Identifiable {
    let id = UUID()
    let name: String
}

struct ClothesView: View {
   
    @State private var tasks = [Task1(name: "EP Clothes @ Mon. 10-12pm"), Task1(name: "Chan Clothes @ Mon. 10-12pm"), Task1(name: "PROP Shop @ Mon. 10-12pm")]
    @State private var readyToNavigate : Bool = false
    @State private var home : Bool = false
    
    var body: some View {
        
        NavigationStack {
            ZStack{
                
                Circle()
                    .scale(2)
                    .foregroundColor(Color(red: 0.855, green: 0.92, blue: 0.979))
                    .padding(.top,-840.0)
                    .ignoresSafeArea()
                
                
                Text("Clothes Pick-Up")
                    .font(.system(size: 40.0))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    .bold()
                    .padding(.top,-160.0)
                
                
            }
            
            List {
                Section {
                    ForEach($tasks) {$task1 in
                        TaskViewCell1(task1: $task1)
                    }
                    .onDelete { indexSet in //indexSet
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .scrollContentBackground(.hidden)
            .padding(.top,-250.0)
        Button(action: {
            home = true
            }) {
                Image(systemName: "app")
                    .foregroundColor(Color(red: 0.426, green: 0.533, blue: 0.971))
                    .font(.system(size: 45.0, weight: .bold))
                    .padding(.bottom, -19)
            }
            .navigationTitle("Navigation")
            .navigationDestination(isPresented: $home) {
               HomeView()
           }
            .navigationBarHidden(true)
        }
        
    }
    
    
}
    
struct TaskViewCell1: View {
    @State private var readyToNavigate : Bool = false
    @Binding var task1: Task1
    
    var body: some View {
        Button {
            readyToNavigate = true
        } label: {
            ZStack{
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.855, green: 0.92, blue: 0.979))
                    .frame(width: 350.0, height: 100)
                Text(task1.name)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    .bold()
                
            }
        }
        .navigationTitle("Back")
        .navigationDestination(isPresented: $readyToNavigate) {
            FoodScheduleView(task: "$task1")
        }
        .navigationBarHidden(true)
        
    }
    
    
    struct ClothesView_Previews: PreviewProvider {
        static var previews: some View {
            ClothesView()
        }
    }
    
    
}
