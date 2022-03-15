//
//  ChatRow.swift
//  CIS Friender
//
//  Created by Kiki on 14/3/2022.
//

import SwiftUI

struct ChatRow: View {
    
    var body: some View {
        HStack(spacing: 20){
            Image("Girl 1")
                .resizable()
                .frame(width: 70, height: 70, alignment: .topLeading)
                .clipShape(Circle())
            
            ZStack{
                VStack(alignment: .leading) {
                    HStack{
                        //TODO: Fetch users
                        Text("Irene")
                            .bold()
                            .foregroundColor(Constants.darkBlue)
                        
                        Spacer()
                        //TODO: Sent date
                        Text("11/7/2022")
                            .foregroundColor(Constants.lightBlue)
                    }
                
                        //TODO: Display user last message
                        Text("You are really funny")
                            .lineLimit(2)
                            .frame(maxWidth: .infinity)
                            .padding()
                    
                }
            }
            .frame(height:80)
        }
    }
    
    func todayDate(){
        var components = Calendar.current.dateComponents( [.hour,.minute], from: Date.now)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow()
    }
}
