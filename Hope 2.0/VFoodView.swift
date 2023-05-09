//
//  VFoodView.swift
//  Hope 2.0
//
//  Created by 90310470 on 5/2/23.
//

import SwiftUI

struct Task11: Identifiable {
    let id = UUID()
    let name: String
}

struct VFoodView: View {
   
    @State private var tasks = [Task11(name: "MN Food Bank @ Mon. 10-12pm"), Task11(name: "Joe Food Bank @ Mon. 10-12pm"), Task11(name: "Smith Food Bank @ Mon. 10-12pm")]
    @State private var readyToNavigate11 : Bool = false
    @State private var home : Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack{
                
                Circle()
                    .scale(2)
                    .foregroundColor(Color(red: 0.855, green: 0.92, blue: 0.979))
                    .padding(.top,-840.0)
                    .ignoresSafeArea()
                
                
                Text("Food Pick-Up")
                    .font(.system(size: 40.0))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    .bold()
                    .padding(.top,-160.0)
                
                Button(action: {
                    readyToNavigate11 = true
                    }) {
                        Text("HOST")
                            .foregroundColor(Color(red: 0.426, green: 0.533, blue: 0.971))
                            .font(.system(size: 15.0, weight: .bold))
                            .padding(.bottom, 40)
                            .padding(.leading, 260)
                    }
                    .navigationTitle("Navigation")
                    .navigationDestination(isPresented: $readyToNavigate11) {
                        CreateEvent(task: "hi")
                   }
                    .navigationBarHidden(true)
            }
            
            
            List {
                
                
                Section {
                    ForEach($tasks) {$task11 in
                        TaskViewCell11(task11: $task11)
                    }
                    .onDelete { indexSet in //indexSet
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .scrollContentBackground(.hidden)
            .padding(.top,-230.0)
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
               VolunteerHomeView()
           }
            .navigationBarHidden(true)
        }
        
    }
    
    
}
    
struct TaskViewCell11: View {
    @State private var readyToNavigate : Bool = false
    @Binding var task11: Task11
    
    var body: some View {
        Button {
            readyToNavigate = true
        } label: {
            ZStack{
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.855, green: 0.92, blue: 0.979))
                    .frame(width: 350.0, height: 100)
                Text(task11.name)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    .bold()
                
            }
        }
        .navigationTitle("Back")
        .navigationDestination(isPresented: $readyToNavigate) {
            FoodScheduleView(task: "$task")
        }
        .navigationBarHidden(true)
        
    }
    
    
    struct VFoodView_Previews: PreviewProvider {
        static var previews: some View {
            VFoodView()
        }
    }
    
    
}

