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
    @State var isCorrectForm:Bool = false
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                //                NavigationLink(destination:Home(), isActive: $isLoggedIn) { EmptyView() }
                HeroSectionView()
                VStack{
                    Text("Name *")
                        .padding(.top, 16)
                    TextField("Name", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                    Text("Email *")
                        .padding(.top, 8)
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                    Button("Next"){
                        if (!firstName.isEmpty && !email.isEmpty) {
                            isCorrectForm = true
                        }
                    }
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
            .navigationDestination(isPresented: $isLoggedIn){Home()}
            .navigationDestination(isPresented: $isCorrectForm){Onboarding2()}
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
