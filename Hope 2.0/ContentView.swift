//
//  ContentView.swift
//  Hope 2.0
//
//  Created by 90310470 on 3/18/23.
//

import SwiftUI
@MainActor class Name : ObservableObject {
    @Published var text = ""
}
struct ContentView: View {
    @StateObject var user = Name()
    @State private var username = ""
    @State private var password = ""
    @State private var location = ""
    @State private var language = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var readyToNavigate : Bool = false
    @State var need = true
    @State var choosePage = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.white
                    .ignoresSafeArea()
                
                Circle()
                    .scale(2)
                    .foregroundColor(Color(red: 0.855, green: 0.92, blue: 0.979))
                    .padding(.top,-130.0)
                    .ignoresSafeArea()
                VStack {
                    Text("WELCOME")
                        .font(.system(size: 56.0))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.426, green: 0.533, blue: 0.971))
                        .bold()
                        .padding(.bottom,-40.0)
                    
                    TextField("Name", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .padding(.top,100)

                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                       
                        .padding(.top,10)
                    TextField("Location", text: $location)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        
                        .padding(.top,10)
                    TextField("Languges Spoken", text: $language)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        
                        .padding(.top,10)
                    HStack{
                        Button(action:{need = true; choosePage=1 }){
                            Text("")
                                .frame(width:30, height:30)
                                .background(need ? Color(red: 0.426, green: 0.533, blue: 0.971) : Color(red: 0.855, green: 0.92, blue: 0.979))
                                .cornerRadius(100)
                                .foregroundColor(Color.black)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius:100)
                                    .stroke(Color.white, lineWidth:6)
                                    .scaleEffect(0.6)
                            )
                            Text("Need Assistance")
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.426, green: 0.533, blue: 0.971))
                                .padding(.leading,-100)
                                .padding(.top,80)
                        }
                    
                        Button(action:{need = false; choosePage=2 }){
                            Text("    ")
                                .frame(width:30, height:30)
                                .background(need ? Color(red: 0.855, green: 0.92, blue: 0.979) : Color(red: 0.426, green: 0.533, blue: 0.971))
                                .cornerRadius(100)
                                .foregroundColor(Color.black)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius:100)
                                    .stroke(Color.white, lineWidth:6)
                                    .scaleEffect(0.6)
                            )
                            Text("Volunteer")
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.426, green: 0.533, blue: 0.971))
                                .padding(.leading,-77)
                                .padding(.top,80)
                        }
                        .padding(.leading,40)
                   
                    }
                    .padding(.top,20)
                    
                    ZStack{
                        Button {
                            readyToNavigate = true
                        } label: {
                            Image(systemName: "arrow.forward")
                                                           .foregroundColor(Color.white)
                                                               .font(.system(size: 45.0, weight: .bold))
                                                               .padding(.top,100)
                        }
                        .foregroundColor(Color(red: 0.446, green: 0.451, blue: 0.447))
                        .frame(width: 80, height: 50)
                        .background(Color(red: 0.426, green: 0.533, blue: 0.971))
                        .cornerRadius(10)
                        .padding(.top,100.0)
                        Image(systemName: "arrow.forward")
                                                       .foregroundColor(Color.white)
                                                           .font(.system(size: 45.0, weight: .bold))
                                                           .padding(.top,100)
                    }
                     .navigationTitle("Navigation")
                     .navigationDestination(isPresented: $readyToNavigate) {
                         if choosePage == 2 {
                             VolunteerHomeView()
                         } else {
                             HomeView()
                         }
                        
                    }
                     
                     .navigationBarHidden(true)
                    
                    }
                }
            }
           
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "2" {
            //wrongUsername = 0
            if password.lowercased() == "2" {
             //   wrongPassword = 0
            //    showHomeScreen = true
            } else {
           //     wrongPassword = 2
            }
        } else {
         //   wrongUsername = 2
        }
    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
