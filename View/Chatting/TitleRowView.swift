//
//  TitleRowView.swift
//  CIS Friender
//
//  Created by Kiki on 31/3/2022.
//



import SwiftUI

struct TitleRowView: View {
    var imageUrl = URL(string:"https://i.pinimg.com/originals/d4/fd/2b/d4fd2bdfbc8a0c5db5795fe9d9693c21.jpg")
    var name = "Shirley"
    
    var body: some View {
        HStack(spacing:20){
            //loading image
            AsyncImage(url:imageUrl){ image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height:50)
                    .cornerRadius(50)
            } //adding this for the sake of xcode
        placeholder:{
                ProgressView()
            }
            
            VStack(alignment: .leading){
                Text(name)
                    .font(.title).bold()
                Text("Online")
                    .font(.caption)
                    .foregroundColor(Constants.lightGrey)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            //report button
            //TODO: change icon
            Image(systemName:"phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
    }
}

struct TitleRowView_Previews: PreviewProvider {
    static var previews: some View {
        TitleRowView()
            .background(Constants.blue)
    }
}
