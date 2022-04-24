//
//  pickTags.swift
//  CIS Friender
//
//  Created by MJ on 20/3/2022.
//

import SwiftUI

struct PickTags: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var text: String = ""
    
    //Tags...
    @State var tags: [Tag] = []
    @State var showAlert: Bool = false
    
    var body: some View{
        
        NavigationView {
            VStack{
                
                Text("Create \nYour Tags ")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Custom Tag View
                TagsView(maxLimit: 50, tags: $tags)
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
                    
                   addTag(tags: tags, text: text, fontSize: 16, maxLimit: 150)
                    {
                        alert, tag in
                        
                        if alert{
                            
                            // showing alert
                            showAlert.toggle()
                            
                        }else{
                            //adding tag
                            tags.append(tag)
                            text = ""
                        }
                    }
                    
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
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Tag Limit Exceeed, try to delete some tags!!"), dismissButton: .destructive(Text("OK")))
        }
    }
}

struct Home_Previews: PreviewProvider{
    static var previews: some View{
        PickTags()
    }
}
