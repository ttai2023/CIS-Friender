//
//  SearchView.swift
//  CIS Friender
//
//  Created by Shirley Deng on 25/2/2022.
//

import SwiftUI

struct SearchView: View
{
    var names: [String] = ["terri", "michelle", "keona", "shirley"]
    @State private var searchText = ""
    
    var body: some View
    {
        NavigationView
        {
            Text("Searching for \(searchText)")
                .searchable(text: $searchText, prompt: "Look for someone")
                .navigationTitle("Searchable Example")
        }
    }
}

struct SearchView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SearchView()
    }
}
