//
//  pickTags.swift
//  CIS Friender
//
//  Created by MJ on 20/3/2022.
//

import SwiftUI

struct PickTags: View {
    @State var text: String = ""
    
    //Tags...
    @State var tags: [Tag] = []
    
    var body: some View{
        
        VStack{
            
            Text("Create \nYour Tags ")
                .font(.system(size: 45, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Custom Tag View
            TagsView(maxLimit: 150, tags: $tags)
            // default height...
                .frame(height: 280)
                .padding(.top,20)
            
            
            //TextField
            TextField("create tag", text: $text)
                .font(.title3)
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(
                    
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color(.white).opacity(0.5), lineWidth: 1)
                )
                .environment(\.colorScheme, .dark)
                .padding(.vertical,8)
            
            //Add button
            Button {
                
                // Adding Tag...
                tags.append(Tag(text: text))
                text = ""
                
            }label: {
                Text("Add Tag")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("background"))
                    .padding(.vertical,12)
                    .padding(.horizontal,45)
                    .background(.white)
                    .cornerRadius(10)
                
            }
            // Disabling Button
            .disabled(text == "")
            .opacity(text == "" ? 0.6 : 1)
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
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
