//
//  UserProfile.swift
//  CapstoneLittleLemonProject
//
//  Created by Valerie Gorbik on 9/3/23.
//

import SwiftUI

let kOrderStatusNotifs = "Order Status Notifications key"
let kPswdChngNtfs = "Password Changes Notifications key"
let kSpclOffrsNtfs = "Special Offers Notifications key"
let kNwslttrNtfs = "Newsletter Notifications key"
struct UserProfile: View {
    @State var firstName:String = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State var email:String = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State var phoneNum:String = UserDefaults.standard.string(forKey: kPhoneNum) ?? ""
    @State var orderStatusNotifs:Bool = UserDefaults.standard.bool(forKey: kOrderStatusNotifs)
    @State var pswdChngNtfs:Bool = UserDefaults.standard.bool(forKey: kPswdChngNtfs)
    @State var spclOffrsNtfs:Bool = UserDefaults.standard.bool(forKey: kSpclOffrsNtfs)
    @State var nwslttrNtfs:Bool = UserDefaults.standard.bool(forKey: kNwslttrNtfs)
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack(alignment: .leading){
            Image("logo-header")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.leading, 110)
                .padding(.trailing, 110)
            Text("Perfonal information")
                .font(.system(.headline))
                .padding(.leading, 8)
            HStack(spacing:16){
                Image("profile-image-placeholder")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(300)
                Button("Change"){}
                    .frame(minWidth:0, maxWidth: 70)
                    .padding(8)
                    .background(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255))
                    .cornerRadius(25)
                    .foregroundColor(Color.white)
                    .font(.system(.body)).bold()
                Button("Remove"){}
                    .frame(minWidth:0, maxWidth: 70)
                    .padding(8)
                    .border(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255),width:2)
                    .foregroundColor(Color.gray)
                    .font(.system(.body)).bold()
            }
            .padding(8)
            VStack(alignment: .leading) {
                Text("Full Name")
                TextField(firstName, text: $firstName)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(8)
                    .border(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255), width: 0.5)
                    .cornerRadius(10)
                Text("Email")
                TextField(email, text: $email)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(8)
                    .border(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255), width: 0.5)
                    .cornerRadius(10)
                Text("Phone number")
                TextField(phoneNum, text: $phoneNum)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(8)
                    .border(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255), width: 0.5)
                    .cornerRadius(10)
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
                Button("Log out") {
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    self.presentation.wrappedValue.dismiss()
                }
                .frame(minWidth:0, maxWidth: .infinity)
                .padding(8)
                .background(Color(red:  244 / 255, green: 206 / 255, blue: 20 / 255))
                .cornerRadius(25)
                .foregroundColor(Color.black)
                .font(.system(.body)).bold()
                .padding(.top, 8)
                HStack(spacing: 16){
                    Button("Discard changes") {}
                        .frame(minWidth:0, maxWidth: 150)
                        .padding(8)
                        .border(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255),width:1)
                        .cornerRadius(10)
                        .foregroundColor(Color.gray)
                        .font(.system(.body)).bold()
                    Button("Save changes") {
                        if (firstName != UserDefaults.standard.string(forKey: kFirstName)) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                        }
                        if (email != UserDefaults.standard.string(forKey: kEmail)) {
                            UserDefaults.standard.set(email, forKey: kEmail)
                        }
                        if (phoneNum != UserDefaults.standard.string(forKey: kPhoneNum)) {
                            UserDefaults.standard.set(phoneNum, forKey: kPhoneNum)
                        }
                        if (orderStatusNotifs != UserDefaults.standard.bool(forKey: kOrderStatusNotifs)) {
                            UserDefaults.standard.set(orderStatusNotifs, forKey: kOrderStatusNotifs)
                        }
                        if (pswdChngNtfs != UserDefaults.standard.bool(forKey: kPswdChngNtfs)) {
                            UserDefaults.standard.set(pswdChngNtfs, forKey: kPswdChngNtfs)
                        }
                        if (spclOffrsNtfs != UserDefaults.standard.bool(forKey: kSpclOffrsNtfs)) {
                            UserDefaults.standard.set(spclOffrsNtfs, forKey: kSpclOffrsNtfs)
                        }
                        if (nwslttrNtfs != UserDefaults.standard.bool(forKey: kNwslttrNtfs)) {
                            UserDefaults.standard.set(nwslttrNtfs, forKey: kNwslttrNtfs)
                        }
                    }
                        .frame(minWidth:0, maxWidth: 150)
                        .padding(8)
                        .background(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255))
                        .cornerRadius(10)
                        .foregroundColor(Color.white)
                        .font(.system(.body)).bold()
                }
                .padding(.leading, 8)
                .padding(.top, 8)
            }
            .padding(.leading, 8)
            Spacer(minLength: 20)
        }
        .padding(8)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
