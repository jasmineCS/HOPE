//
//  ToyScheduleIView.swift
//  Hope 2.0
//
//  Created by 90310470 on 4/11/23.
//

import SwiftUI

struct ToyScheduleView: View {
    let task: String
    @State private var name = ""
    @State private var timeSlot = ""
    @State private var location = ""
    @State private var age = ""
    @State private var occation = ""
    @State private var readyToNavigate1 : Bool = false
    @State var need = true
    @State private var appOp = 1
   
    var body: some View {
        VStack {
            Text("SCHEDULE PICK-UP")
                .font(.system(size: 35.0))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.426, green: 0.533, blue: 0.971))
                .bold()
                .padding(.top, 0)
            
            TextField("First and Last Name", text: $name)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(.top,40)
            
            TextField("Time", text: $timeSlot)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(.top,10)
            
            TextField("Age", text: $age)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(.top,10)
            
            TextField("Occation/Preferances/Gender", text: $occation,  axis: .vertical)
                .lineLimit(5...7)
                .padding()
                .frame(width: 300, height: 125)
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
                    readyToNavigate1 = true
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
                
            }
            .navigationTitle("Navigation")
            .navigationDestination(isPresented: $readyToNavigate1) {
                HomeView()
            }
            .navigationBarHidden(true)
            
        }

           //Text("Selected Location: \(task)")
            //   .font(.largeTitle)

           }
    }


struct ToyScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ToyScheduleView(task: "hi")
    }
}
