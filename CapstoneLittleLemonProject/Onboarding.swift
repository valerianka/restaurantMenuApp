//
//  Onboarding.swift
//  CapstoneLittleLemonProject
//
//  Created by Valerie Gorbik on 9/1/23.
//

import SwiftUI

let kFirstName = "First Name key"
let kEmail = "Email key"
let kPhoneNum = "Phone Number key"
let kIsLoggedIn = "kIsLoggedIn"
struct Onboarding: View {
    @State var firstName:String = ""
    @State var email:String = ""
    @State var isLoggedIn:Bool = false
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                NavigationLink(destination:Home(), isActive: $isLoggedIn) { EmptyView() }
                Image("logo-header")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 110)
                    .padding(.trailing, 110)
                VStack(alignment: .leading){
                    Text("Little Lemon")
                        .padding(.top, 16)
                        .foregroundColor(Color(red: 244 / 255, green: 206 / 255, blue: 20 / 255))
                        .font(.system(.largeTitle).bold())
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Chicago")
                                .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                                .font(.system(.title).bold())
                                .padding(.bottom, 8)
                            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
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
                .frame(minHeight: 300)
                .background(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255))
                VStack{
                    Text("Name *")
                        .padding(.top, 16)
                    TextField("Name", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                    Text("Email *")
                        .padding(.top, 8)
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                    NavigationLink("Next"){Onboarding2()}
                    .padding(.top, 8)
                    Spacer()
                }
                .padding(.leading, 8)
            }
            .onAppear(){
                if (UserDefaults.standard.bool(forKey: kIsLoggedIn)) {
                    isLoggedIn = true
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
