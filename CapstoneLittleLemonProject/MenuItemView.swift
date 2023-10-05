//
//  MenuItemView.swift
//  CapstoneLittleLemonProject
//
//  Created by Valerie Gorbik on 9/29/23.
//

import SwiftUI

struct MenuItemView: View {
    let dish: Dish
    var body: some View {
        HStack() {
            VStack(alignment: .leading){
                Text(dish.title ?? "")
                    .font(.title)
                Text(dish.itemDescription ?? "")
                    .font(.body)
                Text((dish.price ?? "") + "$")
                    .font(.body).bold()
            }
            VStack(alignment: .trailing){
                AsyncImage(url: URL(string: dish.image ?? "")){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
            }
        }
    }
}
