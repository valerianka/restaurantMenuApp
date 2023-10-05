//
//  HeroSectionView.swift
//  CapstoneLittleLemonProject
//
//  Created by Valerie Gorbik on 10/4/23.
//

import SwiftUI

struct HeroSectionView: View {
    var body: some View {
        VStack{
            Image("logo-header")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.leading, 50)
                .padding(.trailing, 50)
            VStack(alignment: .leading){
                Text("Little Lemon")
                    .padding(.top, 16)
                    .foregroundColor(Color(red: 244 / 255, green: 206 / 255, blue: 20 / 255))
                    .font(.system(.largeTitle).bold())
                HStack {
                    VStack(alignment: .leading) {
                        Text("Chicago")
                            .foregroundColor(Color.white)
                            .font(.system(.title).bold())
                            .padding(.bottom, 8)
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .foregroundColor(Color.white)
                            .font(.system(.body))
                            .padding(.trailing, 8)
                    }
                    Image("food-photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading, 8)
                }
                .padding(.bottom, 16)
            }
            .padding(.leading, 8)
            .padding(.trailing, 8)
            .frame(minHeight: 350)
            .background(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255))
        }
    }
}

struct HeroSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HeroSectionView()
    }
}
