//
//  VolunteerHomeView.swift
//  Hope 2.0
//
//  Created by 90310470 on 4/13/23.
//

import SwiftUI


struct VolunteerHomeView: View {
    @State private var readyToNavigate1 : Bool = false
    @State private var readyToNavigate2 : Bool = false
    @State private var readyToNavigate3 : Bool = false
    @State private var readyToNavigate4 : Bool = false
    @State private var readyToNavigate5 : Bool = false
    @State private var readyToNavigate6 : Bool = false
    @State private var home : Bool = false
    @State private var appOp = 0
    @State private var appOp2 = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                ZStack{
                    
                    Circle()
                        .scale(2)
                        .foregroundColor(Color(red: 0.855, green: 0.92, blue: 0.979))
                        .padding(.top,-1230.0)
                        .ignoresSafeArea()
                    
                    
                    Text("Welcome, Volunteer!")
                        .font(.system(size: 38.0))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                        .bold()
                        .padding(.top,-350.0)
                    
                    
                }
                VStack{
                    
                    HStack{
                     //I intend to make a varible that can check to see if the user is a volunteer then offer the ability to host or create things!!
                            Button(action: {
                                readyToNavigate1 = true; appOp=1
                            }) {
                                Image("FoodButton")
                                    .renderingMode(.original)
                            }
                            .navigationTitle("Navigation")
                            .navigationDestination(isPresented: $readyToNavigate1) {
                                CreateEvent(task: "hi")
                            }
                            .navigationBarHidden(true)
                        
                        
                    Button(action: {
                        readyToNavigate2 = true; appOp2 = 1
                            }) {
                                Image("ClothesButton")
                                    .renderingMode(.original)
                            }
                            .navigationTitle("Navigation")
                            .navigationDestination(isPresented: $readyToNavigate2) {
                                CreateEvent(task: "hi")
                            }
                            .navigationBarHidden(true)
                            
                        
                        Button(action: {
                            readyToNavigate3 = true
                        }) {
                            Image("ToyButton")
                                .renderingMode(.original)
                        }
                        .navigationTitle("Navigation")
                        .navigationDestination(isPresented: $readyToNavigate3) {
                            CreateEvent(task: "hi")
                       }
                      
                        .navigationBarHidden(true)
                        
                    }
                    HStack{
                        
                        Button(action: {
                            readyToNavigate4 = true
                        }) {
                            Image("TranslationButton")
                                .renderingMode(.original)
                        }
                        .navigationTitle("Navigation")
                        .navigationDestination(isPresented: $readyToNavigate4) {
                            CreateEvent(task: "hi")
                       }
                      
                        .navigationBarHidden(true)
                        
                        Button(action: {
                            readyToNavigate5 = true
                        }) {
                            Image("EventButton")
                                .renderingMode(.original)
                        }
                        .navigationTitle("Navigation")
                        .navigationDestination(isPresented: $readyToNavigate5) {
                            CreateEvent(task: "hi")
                       }
               
                        .navigationBarHidden(true)
                        
                        Button(action: {
                            readyToNavigate6 = true
                        }) {
                            Image("MedButton")
                                .renderingMode(.original)
                        }
                        .navigationTitle("Navigation")
                        .navigationDestination(isPresented: $readyToNavigate6) {
                            CreateEvent(task: "hi")
                       }
                       
                        .navigationBarHidden(true)
                    }
                    
                }
                .padding(.top,-140)
                
         //appointment section
                Text("Scheduled Events")
                    .font(.title)
                    .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    .bold()
                    .padding(.top, 200)
                    .padding(.leading, -80)
              
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.855, green: 0.92, blue: 0.979))
                        .frame(width:290.0, height: 80)
                     .padding(.leading, -40)
                        
                        
                    Text("EP Food Bank | 10 am | Monday")
                        .padding(.top,-20)
                        .padding(.leading,-50)
                    Text("Deliverey")
                        .padding(.top,30)
                        .padding(.leading,-144)
                        .bold()
                }
                .padding(.top, 340)
                .opacity(Double(appOp))
                .padding(.leading,10)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.855, green: 0.92, blue: 0.979))
                        .frame(width:290.0, height: 80)
                     .padding(.leading, -40)
                        
                        
                    Text("Meet-Up | 1 pm | Thursday")
                        .padding(.top,-20)
                        .padding(.leading,-85)
                    Text("Getting a ride")
                        .padding(.top,30)
                        .padding(.leading,-144)
                        .bold()
                       
                }
                .padding(.top, 540)
                .opacity(Double(appOp2))
                .padding(.leading,10)
          
                Button(action: {
                    home = true
                }) {
                    Image(systemName: "app")
                        .foregroundColor(Color(red: 0.426, green: 0.533, blue: 0.971))
                        .font(.system(size: 45.0, weight: .bold))
                        .padding(.top, 750)
                }
                .navigationTitle("Navigation")
                .navigationDestination(isPresented: $home) {
                   HomeView()
               }
                .navigationBarHidden(true)
                
                }
           
            }
       
        }
    
    struct VolunteerHomeView_Previews: PreviewProvider {
        static var previews: some View {
            VolunteerHomeView()
        }
    }
}
