//
//  ListView.swift
//  Hope 2.0
//
//  Created by 90310470 on 4/13/23.
//

import SwiftUI

struct CreateEvent: View {
    
    let task: String
    @State private var name = ""
    @State private var time = ""
    @State private var location = ""
    @State private var event = ""
    @State private var volunteersNeeded = ""
    @State private var email = ""
    @State private var readyToNavigate1 : Bool = false
    @State var need = true
    @State private var appOp = 1
    var body: some View {
        VStack {
            Text("CREATE EVENT")
                .font(.system(size: 30.0))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.426, green: 0.533, blue: 0.971))
                .bold()
                .padding(.top, -70)
            
            TextField("First and Last Name", text: $name)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(.top,40)
            
            TextField("Email", text: $email)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(.top,10)
            
            TextField("Number of Volunteers Needed", text: $volunteersNeeded)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(.top,10)
            
            TextField("Event Name", text: $event)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(.top,10)
            
            TextField("Time of Event", text: $time)
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
            
            
            //.padding(.leading,25)
            //.environmentObject(data)
            
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
                VolunteerHomeView()
            }
            .navigationBarHidden(true)
            
            
        }

           

           }
    }


struct CreateEvent_Previews: PreviewProvider {
    static var previews: some View {
        CreateEvent(task: "hi")
    }
}
