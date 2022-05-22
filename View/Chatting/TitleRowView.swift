//
//  TitleRowView.swift
//  CIS Friender
//
//  Created by Kiki on 31/3/2022.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct TitleRowView: View {
    @EnvironmentObject private var userManager: UserManager
    @EnvironmentObject var swipingData: SwipingModel
    
    var body: some View {
//        ForEach(swipingData.swipedUsers){ CISUser in
        
        VStack(alignment: .leading){
            Text("Chat")
                .font(.system(size: 40, weight: .bold))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
//        HStack(spacing:10){
            //loading image
//            Image(systemName: "person.circle")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 50, height:50)
//                    .cornerRadius(50)
//
//                    .padding(40)
            
            HStack(spacing: 10){
            Text("Having problem with this user? Let us know")
                    .foregroundColor(.red)
                    .font(.system(size: 10))
            
            //report button
            Image(systemName:"person.crop.circle.badge.exclamationmark.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
            }
//            }
//
        
       
        
//        placeholder:{
//                ProgressView()
//            }
        
            
         
        }
    }
    


struct TitleRowView_Previews: PreviewProvider {
    static var previews: some View {
        TitleRowView()
            .background(Constants.blue)
    }
}
