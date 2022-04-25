//
//  TagsView.swift
//  CIS Friender
//
//  Created by MJ on 22/3/2022.
//

import SwiftUI

// Custom View...
struct TagsView: View {
    var maxLimit: Int
    @Binding var tags: [Tag]
    
    var title: String = "What's your hobby? Pet? Favorite Book?"
    var fontSize: CGFloat = 16
    
    // Adding Geometry Effect to Tag
    @Namespace var animation
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15){
            
            Text(title)
                .font(.callout )
                .foregroundColor(Color("Color"))
            
            
            //ScrollView
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 10){
                    
                    // Displaying Tags
                    
                    ForEach(getRows(), id: \.self){ rows in
                        
                        HStack(spacing: 6){
                            
                            ForEach(rows){row in
                                
                                // Row View...
                                RowView(tag: row)
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 80, alignment: .leading)
                .padding(.vertical)
                .padding(.bottom,20)
            }
            .frame(maxWidth: .infinity)
            .background(
                
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.white.opacity(0.5),lineWidth: 1)
            )
            // Animation...
            .animation(.easeInOut, value: tags)
            overlay(
                Text("\(getSize(tags: tags))/\(maxLimit)")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(Color.white)
                    .padding(12),
                
                alignment: .bottomTrailing
            
            
            
            )
        }
//
  
    }
    
    @ViewBuilder
    func RowView(tag: Tag)->some View{
        
        Text(tag.text)
            .font(.system(size: fontSize))
            
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(
                
                Capsule()
                    .fill(.white)
                
            )
            .foregroundColor(Color("Color"))
            .lineLimit(1)
        
            .contentShape(Capsule())
            .contextMenu{
                
                Button("Delete"){
                    tags.remove(at: getIndex(tag: tag))
                    
                }
            }
            .matchedGeometryEffect(id: tag.id, in: animation)

         }
    
    func getIndex(tag: Tag)->Int{
        
        let index = tags.firstIndex { currentTag in
            return tag.id == currentTag.id
        } ?? 0
        
        return index
    }
    
    //Splitting the array when it exceeds the screen size...
    func getRows()->[[Tag]]{
       
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        
        //calculating text width
        var totalWidth: CGFloat = 0
        
        let screenWidth: CGFloat = UIScreen.main.bounds.width - 90
        
        tags.forEach { tag in
            
            // updating total wideth...
            totalWidth += (tag.size + 40)
            
            //checking if total width is greater than size
            if totalWidth > screenWidth{
                // adding row in rows
                // clearing the data
                totalWidth = (!currentRow.isEmpty || rows.isEmpty ? (tag.size + 40) : 0)
                
                rows.append(currentRow)
                //currentRow.removeAll()
                currentRow.append(tag)
                
            }else{
                currentRow.append(tag)
            }
        }
        
        if currentRow.isEmpty{
            rows.append(currentRow)
            currentRow.removeAll()
        }
        
        return rows
    }
        
       
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        PickTags()
    }
}

// Global Function
func addTag(tags: [Tag], text: String, fontSize: CGFloat, maxLimit: Int,completion: @escaping(Bool, Tag)->()){

    // geting text size...
    let font = UIFont.systemFont(ofSize: fontSize)
    
    let attributes = [NSAttributedString.Key.font: font]
    
    let size = (text as NSString).size(withAttributes: attributes)
   
    let tag = Tag(text: text, size: size.width)
    
    if (getSize(tags: tags) + text.count) < maxLimit{
        completion(false,tag)
    }else{
        completion(true,tag)
    }
    
}

func getSize(tags: [Tag])-> Int{
    var count: Int = 0
    
    tags.forEach { tag in
        count += tag.text.count
         
    }
    
    return count
}
