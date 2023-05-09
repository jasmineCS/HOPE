//
//  TranslationView.swift
//  Hope 2.0
//
//  Created by 90310470 on 4/9/23.
//

import SwiftUI
struct Task4: Identifiable {
    let id = UUID()
    let name: String
    let details: String
    let pic: String
}
struct TranslationView: View {
    @State private var tasks = [Task4(name: "Sarah Jones ", details: "Spanish|English|Dutch", pic: "profile1"), Task4(name: "Kate Joe", details: "Ukranian|Russian", pic: "profile3"), Task4(name: "Joe Smith", details: "Slavic Languages", pic: "profile2")]
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
                
                
                Text("Avalible Translators")
                    .font(.system(size: 37.0))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    .bold()
                    .padding(.top,-160.0)
                
                
            }
            
            List {
                Section {
                    ForEach($tasks) {$task4 in
                        TaskViewCell4(task4: $task4)
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
struct TaskViewCell4: View {
    @State private var readyToNavigate : Bool = false
    @Binding var task4: Task4
    
    var body: some View {
        Button {
            readyToNavigate = true
        } label: {
            HStack{
                Image(task4.pic)
                    .renderingMode(.original)
                    .padding(.leading,10)
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.855, green: 0.92, blue: 0.979))
                    .frame(width: 230.0, height: 100)
                Text(task4.name)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    .bold()
                    .padding(.top,-20)
                Text(task4.details)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    .bold()
                    .padding(.top, 30)
                    //.padding(.leading, 60)
                
            }
        }
            .padding(.leading,-20)
        }
        .navigationTitle("Back")
        .navigationDestination(isPresented: $readyToNavigate) {
            TranslationScheduleView(task: "$task4")
        }
        .navigationBarHidden(true)
        
    }
    
    
    struct TranslationView_Previews: PreviewProvider {
        static var previews: some View {
            TranslationView()
        }
    }
}
