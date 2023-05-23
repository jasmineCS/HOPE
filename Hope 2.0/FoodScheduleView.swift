//
//  FoodScheduleView.swift
//  Hope 2.0
//
//  Created by 90310470 on 4/6/23.
//

import SwiftUI

// import SwiftUIEKtensions // via SPM
struct FoodScheduleView: View {
    let task: String
    @State private var username = ""
    @State private var password = ""
    @State private var location = ""
    @State private var language = ""
    @State private var preferances = ""
    @State private var family = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var readyToNavigate20 : Bool = false
    @State var need = true
    @State private var appOp = 1
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack {
            
        
            
            Text("SCHEDULE PICK-UP")
                .font(.system(size: 35.0))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.426, green: 0.533, blue: 0.971))
                .bold()
                .padding(.top, 0)
            
            TextField("First and Last Name", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(.top,40)
                .border(.red, width: CGFloat(wrongUsername))
            
            TextField("Number of Family Members", text: $family)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .border(.red, width: CGFloat(wrongPassword))
                .padding(.top,10)
            
            TextField("Time", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .border(.red, width: CGFloat(wrongPassword))
                .padding(.top,10)
            
            TextField("Allergies/Preferances", text: $preferances)
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
                .opacity(Double(appOp))
                .padding(.top,10)
            
            HStack{
                Button(action:{appOp = 1; need = true }){
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
                    Text("Delivery")
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.426, green: 0.533, blue: 0.971))
                        .padding(.leading,-75)
                        .padding(.top,80)
                }
                
                Button(action:{appOp = 0; need = false }){
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
                    Text("Pick-Up")
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.426, green: 0.533, blue: 0.971))
                        .padding(.leading,-72)
                        .padding(.top,80)
                }
                .padding(.leading,40)
                
            }
            //.padding(.top,-40)
            
            ZStack{
                
                Button {
                showSheet.toggle()
                } label: {
                    Text("SUBMIT")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                .foregroundColor(Color(red: 0.446, green: 0.451, blue: 0.447))
                .frame(width: 110, height: 50)
                .background(Color(red: 0.426, green: 0.533, blue: 0.971))
                .cornerRadius(10)
                .padding(.top,50.0)
                .sheet(isPresented: $showSheet, content: {
                    ZStack{
                        Text("Sign-Up Confimed")
                            .foregroundColor(Color(red: 0.426, green: 0.533, blue: 0.971))
                         .padding(.top, -180)
                            .font(.system(size: 30.0))
                            .fontWeight(.bold)
                    }
                        Image("check")
                            .renderingMode(.original)
                            .frame(width: 50,height: 50)
                            .padding(.top, -100)
                        Text("Name: \(username)")
                            .padding(.leading, -125)
                            .padding(.bottom, 10)
                            .font(.system(size: 20.0))
                        Text("Number of Family Members: \(family)")
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 10)
                            .font(.system(size: 20.0))
                        Text("Time: \(password)")
                            .padding(.leading, -126)
                            .padding(.bottom, 10)
                            .font(.system(size: 20.0))
                        Text("Allergies/Preferances: \(preferances)")
                            .padding(.leading, -54)
                            .padding(.bottom, 10)
                            .font(.system(size: 20.0))
                        
                        Text("\(location)")
                            .padding(.bottom, 10)
                            .font(.system(size: 20.0))
                    
                        Button(action: {
                            print(readyToNavigate20)
                            readyToNavigate20 = true; showSheet = false
                            print(readyToNavigate20)
                        }) {
                            Text("BACK TO HOME")
                                .bold()
                                .foregroundColor(Color(red: 0.431, green: 0.532, blue: 0.975))
                        }
                        .navigationTitle("Navigation")
                        .navigationDestination(isPresented: $readyToNavigate20) {
                            HomeView()
                        }
                        .navigationBarHidden(true)
               
            } //sheet end
           
            )}
            
                       
        }
                       
           

           }
       }
      





struct FoodScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        FoodScheduleView(task: "task")
    }
}
