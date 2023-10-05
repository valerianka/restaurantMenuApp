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
    @State var isCorrectForm2:Bool = false
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                HeroSectionView()
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
                Button("Register") {
                    if (!phoneNum.isEmpty) {
                        isCorrectForm2 = true
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        UserDefaults.standard.set(phoneNum, forKey: kPhoneNum)
                        UserDefaults.standard.set(orderStatusNotifs, forKey: kOrderStatusNotifs)
                        UserDefaults.standard.set(pswdChngNtfs, forKey: kPswdChngNtfs)
                        UserDefaults.standard.set(spclOffrsNtfs, forKey: kSpclOffrsNtfs)
                        UserDefaults.standard.set(nwslttrNtfs, forKey: kNwslttrNtfs)
                    }
                }
            }
            .navigationDestination(isPresented: $isCorrectForm2) {Home()}}
    }
}

struct Onboarding2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding2()
    }
}
