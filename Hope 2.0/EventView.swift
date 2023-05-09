//
//  EventView.swift
//  Hope 2.0
//
//  Created by 90310470 on 4/11/23.
//

import SwiftUI
struct Task5: Identifiable {
    let id = UUID()
    let name: String
    let place: String
}
struct EventView: View {
    @State private var tasks = [Task5(name: "Meet-Up @ Sun. 5-8pm", place: "EP Community Center"), Task5(name: "Playdate: 0-4 yr old @ Sat. 10-11am", place: "Miller Park"), Task5(name: "Networking: Job Search @ Mon. 1-2pm", place: "EP Community Center")]
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
                
                
                Text("Current Events")
                    .font(.system(size: 40.0))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    .bold()
                    .padding(.top,-160.0)
                
                Button(action: {
                    readyToNavigate = true
                    }) {
                        Text("")//will become hosting button
                            .foregroundColor(Color(red: 0.426, green: 0.533, blue: 0.971))
                            .font(.system(size: 15.0, weight: .bold))
                            .padding(.top, -35)
                            .padding(.leading, 240)
                   }
                    .navigationTitle("Navigation")
                   .navigationDestination(isPresented: $readyToNavigate) {
                       CreateEvent(task: "task")
                   }
                    .navigationBarHidden(true)
            }
            
            
            List {
                
                Section {
                    ForEach($tasks) {$task5 in
                        TaskViewCell5(task5: $task5)
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
struct TaskViewCell5: View {
    @State private var readyToNavigate : Bool = false
    @Binding var task5: Task5
    
    var body: some View {
        Button {
            readyToNavigate = true
        } label: {
            ZStack{
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.855, green: 0.92, blue: 0.979))
                    .frame(width: 350.0, height: 100)
                Text(task5.name)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    .bold()
                    .padding(.top,-20)
                Text(task5.place)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    .padding(.top,45)
                
            }
        }
        .navigationTitle("Back")
        .navigationDestination(isPresented: $readyToNavigate) {
            EventScheduleView(task:"hi")
        }
        .navigationBarHidden(true)
        
    }
    struct EventView_Previews: PreviewProvider {
        static var previews: some View {
            EventView()
        }
    }
}
