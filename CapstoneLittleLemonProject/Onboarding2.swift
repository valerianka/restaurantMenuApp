//
//  Onboarding2.swift
//  CapstoneLittleLemonProject
//
//  Created by Valerie Gorbik on 9/28/23.
//

import SwiftUI

struct Onboarding2: View {
    @State var phoneNum:String = ""
    @State var orderStatusNotifs:Bool = false
    @State var pswdChngNtfs:Bool = false
    @State var spclOffrsNtfs:Bool = false
    @State var nwslttrNtfs:Bool = false
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
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
                Text("Phone number *")
                    .padding(.top, 16)
                TextField("Phone number", text: $phoneNum)
                    .textFieldStyle(.roundedBorder)
                Text("Allow to contact me about:")
                Group{
                    Text("Email notifications")
                        .font(.system(.headline)).bold()
                .padding(.top, 8)
                    Toggle(isOn: $orderStatusNotifs) {
                        Text("Order statuses")
                    }
                    .toggleStyle(.switch)
                    Toggle(isOn: $pswdChngNtfs) {
                        Text("Password changes")
                    }
                    .toggleStyle(.switch)
                    Toggle(isOn: $spclOffrsNtfs) {
                        Text("Special offers")
                    }
                    .toggleStyle(.switch)
                    Toggle(isOn: $nwslttrNtfs) {
                        Text("Newsletter")
                    }
                    .toggleStyle(.switch)
                }
                NavigationLink("Register") { Home() }
            }
        }
    }
}

struct Onboarding2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding2()
    }
}
