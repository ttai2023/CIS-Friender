//
//  MessageField.swift
//  CIS Friender
//
//  Created by Kiki on 31/3/2022.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @State private var message = ""

    var body: some View {
        HStack {
            // Custom text field created below ♪(^∇^*)
            CustomTextField(placeholder: Text("Enter your message here..."), text: $message)
                .frame(height: 52)
                .disableAutocorrection(true)

            Button {
                messagesManager.sendMessage(text: message)
                //reset the message
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Constants.darkBlue)
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(MessagesManager())
    }
}

struct CustomTextField: View {
    var placeholder: Text
    //binding variable mean we can pass a value from a view to another, also modifying the varaible outside that view
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            //Text is what the user will input
            // If text is empty, show the placeholder on top of the TextField
            if text.isEmpty {
                placeholder
                .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
