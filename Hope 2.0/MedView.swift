//
//  MedView.swift
//  Hope 2.0
//
//  Created by 90310470 on 4/11/23.
//

import SwiftUI
struct Task6: Identifiable {
    let id = UUID()
    let name: String
}
struct MedView: View {
    @State private var tasks = [Task6(name: "FairView Office @ Mon. 10-12pm"), Task6(name: "Prosthetics Care @ Mon. 10-12pm")]
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
                
                
                Text("Clinical Offices")
                    .font(.system(size: 40.0))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    .bold()
                    .padding(.top,-160.0)
               
                Button(action: {
                    
                }) {
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(hue: 0.001, saturation: 0.596, brightness: 0.988))
                            .frame(width: 350.0, height: 50)
                        Text("Emergency Call: 911")
                            .foregroundColor(Color(hue: 0.001, saturation: 0.0, brightness: 1.0))
                            .font(.system(size: 32.0, weight: .bold))
                            
                    }
                    .padding(.top,-10)
                }
            }
            
            List {
                Section {
                    ForEach($tasks) {$task6 in
                        TaskViewCell6(task6: $task6)
                    }
                    .onDelete { indexSet in //indexSet
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .scrollContentBackground(.hidden)
            .padding(.top,-210.0)
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
struct TaskViewCell6: View {
    @State private var readyToNavigate : Bool = false
    @Binding var task6: Task6
    
    var body: some View {
        Button {
            readyToNavigate = true
        } label: {
            ZStack{
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.855, green: 0.92, blue: 0.979))
                    .frame(width: 350.0, height: 100)
                Text(task6.name)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    .bold()
                
            }
        }
        .navigationTitle("Back")
        .navigationDestination(isPresented: $readyToNavigate) {
            MedScheduleView(task: "$task3")
        }
        .navigationBarHidden(true)
        
    }
      
}
    

struct MedView_Previews: PreviewProvider {
    static var previews: some View {
        MedView()
    }
}
