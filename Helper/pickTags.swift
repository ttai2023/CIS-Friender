//
//  pickTags.swift
//  CIS Friender
//
//  Created by MJ on 20/3/2022.
//

import SwiftUI

struct PickTags: View {
    @State var text: String = ""
    
    var body: some View{
        
        VStack{
            
            Text("Create Your Tags")
                .font(.system(size: 38, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
                //TextField
            TextField("create tag", text: $text)
                .font(.title3)
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color(.white).opacity(0.5), lineWidth: 1)
                )
            
                .environment(\.colorScheme, .dark)
                .padding(.vertical,12)
            
            //Add button
            Button {
                
            }label: {
                Text("Add Tag")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("background"))
                    .padding(.vertical,12)
                    .padding(.horizontal,45)
                    .background(.white)
                    .cornerRadius(10)
                
            }
            
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("background").ignoresSafeArea()
            )
    }
}

struct Home_Previews: PreviewProvider{
    static var previews: some View{
        PickTags()
    }
}
