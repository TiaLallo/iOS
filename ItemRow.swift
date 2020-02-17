//
//  ItemRow.swift
//  ToDoList
//
//  Created by Tia Lallo on 07/02/2020.
//  Copyright © 2020 Tia Lallo. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)) {
            HStack{
                Image(item.thumbnailImage)
                .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                VStack(alignment: .leading) {
                    Text(item.name)
                    Text(String("$\(item.price)"))
                }
                Spacer()
                
                ForEach(item.restrictions, id: \.self) {restrictions in
                    Text(restrictions)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restrictions, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
