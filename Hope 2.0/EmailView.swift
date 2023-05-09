//
//  TestView.swift
//  Hope 2.0
//
//  Created by 90310470 on 4/9/23.
//

import SwiftUI
import MessageUI

struct EmailView: View {

   @State var result: Result<MFMailComposeResult, Error>? = nil
   @State var isShowingMailView = false

    var body: some View {
        Button(action: {
            self.isShowingMailView.toggle()
        }) {
            Text("")
        }
       // .disabled(!MFMailComposeViewController.canSendMail())
        .sheet(isPresented: $isShowingMailView) {
            MailView(result: self.$result)
        }
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}
