//
//  pickAvatar.swift
//  CIS Friender
//
//  Created by MJ on 19/3/2022.
//

import SwiftUI

struct PickAvatar: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var imageName: String?
    
    private let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    private let images = [
        "Boy 1",
        "Boy 2",
        "Boy 3",
        "Boy 4",
        "Boy 5",
        "Boy 6",
        "Girl 1",
        "Girl 2",
        "Girl 3",
        "Girl 4",
        "Girl 5",
        "Girl 6",
        "Blue jelly",
        "Pink jelly"
        
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(images, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .aspectRatio(1, contentMode: .fill)
                            .clipped()
                            .onTapGesture {
                                dismiss()
                                imageName = image
                            }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            .navigationTitle("pick your avatar")
        }
    }
}

