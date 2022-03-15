//
//  ChattingView.swift
//  CIS Friender
//
//  Created by Kiki on 14/3/2022.
//

import SwiftUI

struct ChattingView: View {
    var body: some View {
        NavigationView{
            List{
                ForEach(0..<10){ i in
                    ChatRow()
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Chats")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // do something here
                    } label: {
                        Label("tap to stop keona singing", systemImage: "square.and.pencil")
                    }
                }
            }
        }
    }
}

struct ChattingView_Previews: PreviewProvider {
    static var previews: some View {
        ChattingView()
    }
}
