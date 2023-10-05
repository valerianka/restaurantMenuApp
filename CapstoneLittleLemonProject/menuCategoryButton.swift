//
//  menuCategoryButton.swift
//  CapstoneLittleLemonProject
//
//  Created by Valerie Gorbik on 9/29/23.
//

import SwiftUI

struct menuCategoryButton: View {
    var category:String
    @State var isOn:Bool
    @Binding var categories:[Bool]
    var body: some View {
        Button(category) {
            self.isOn.toggle()
            if (category == "Starters") {
                categories[0] = true
                categories[1] = false
                categories[2] = false
                categories[3] = false
            } else if (category == "Mains") {
                categories[0] = false
                categories[1] = true
                categories[2] = false
                categories[3] = false
            } else if (category == "Desserts") {
                categories[0] = false
                categories[1] = false
                categories[2] = true
                categories[3] = false
            } else if (category == "Drinks") {
                categories[0] = false
                categories[1] = false
                categories[2] = false
                categories[3] = true
            }
        }
        .frame(minWidth:0, maxWidth:.infinity)
        .padding(8)
        .background(Color(red:  237 / 255, green: 239 / 255, blue: 238 / 255))
        .cornerRadius(25)
        .foregroundColor(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255))
        .font(.system(.body)).bold()
    }
}

