//
//  Menu.swift
//  CapstoneLittleLemonProject
//
//  Created by Valerie Gorbik on 9/1/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText: String = ""
    @State var isStarters: Bool = false
    @State var isMains: Bool = false
    @State var isDesserts: Bool = false
    @State var isDrinks: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
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
                TextField("Search menu", text: $searchText)
                    .frame(minWidth:0, maxWidth:250)
                    .foregroundColor(Color.white)
                    .border(Color.white)
                    .cornerRadius(25)
                    .padding(.bottom, 8)
            }
            .padding(.leading, 8)
            .padding(.trailing, 8)
            .frame(minHeight: 350)
            .background(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255))
            Group{
                Text("ORDER FOR DELIVERY!")
                    .font(.system(.headline))
                    .padding(.leading, 8)
                    .padding(.top, 8)
                HStack{
                    Button("Starters") {
                        isStarters = !isStarters
                    }
                        .frame(minWidth:0, maxWidth:.infinity)
                        .padding(8)
                        .background(Color(red:  237 / 255, green: 239 / 255, blue: 238 / 255))
                        .cornerRadius(25)
                        .foregroundColor(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255))
                        .font(.system(.body)).bold()
                    Button("Mains") {
                        isMains = !isMains
                    }
                        .frame(minWidth:0, maxWidth:.infinity)
                        .padding(8)
                        .background(Color(red:  237 / 255, green: 239 / 255, blue: 238 / 255))
                        .cornerRadius(25)
                        .foregroundColor(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255))
                        .font(.system(.body)).bold()
                    Button("Desserts") {
                        isDesserts = !isDesserts
                    }
                        .frame(minWidth:0, maxWidth:.infinity)
                        .padding(8)
                        .background(Color(red:  237 / 255, green: 239 / 255, blue: 238 / 255))
                        .cornerRadius(25)
                        .foregroundColor(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255))
                        .font(.system(.body)).bold()
                    Button("Drinks") {
                        isDrinks = !isDrinks
                    }
                        .frame(minWidth:0, maxWidth:.infinity)
                        .padding(8)
                        .background(Color(red:  237 / 255, green: 239 / 255, blue: 238 / 255))
                        .cornerRadius(25)
                        .foregroundColor(Color(red:  73 / 255, green: 94 / 255, blue: 87 / 255))
                        .font(.system(.body)).bold()
                }
                .padding(.leading, 8)
                .padding(.top, 8)
            }
        FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors())
        { (dishes: [Dish]) in
            List{
                ForEach(dishes, id:\.id) { dish in
                    HStack(spacing: 16){
                        Text("\(dish.title ?? "")  \(dish.price ?? "")")
                        AsyncImage(url: URL(string: dish.image!))
                            .frame(maxWidth: 30, maxHeight: 30)
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
        }
        }
        .onAppear() {getMenuData(urlStr: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")}
    }
    func getMenuData(urlStr:String) {
        PersistenceController.shared.clear()
        let url:String = urlStr
        let urlObj:URL = URL(string:url)!
        let urlReq:URLRequest = URLRequest(url:urlObj)
        let task = URLSession.shared.dataTask(with:urlReq) { data, response, error in
            if let _ =  error {
                return
            }
                                    
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            if let data = data
            {
                let decoder:JSONDecoder = JSONDecoder()
                let decodedData = try? decoder.decode(MenuList.self, from:data)
                if let decodedData = decodedData {
                    for menuItem in decodedData.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = menuItem.title
                        dish.image = menuItem.image
                        dish.price = menuItem.price
                        dish.category = menuItem.category
                    }
                    try? viewContext.save()
                }
            }
        }
        task.resume()
        
    }
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    func buildPredicate() -> NSPredicate {
        if (!searchText.isEmpty){
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        } else if (isStarters) {
            return NSPredicate(format: "category CONTAINS[cd] %@", "starters")
        } else if (isDesserts) {
            return NSPredicate(format: "category CONTAINS[cd] %@", "desserts")
        } else if (isDrinks) {
            return NSPredicate(format: "category CONTAINS[cd] %@", "mains")
        } else if (isDrinks) {
            return NSPredicate(format: "category CONTAINS[cd] %@", "drinks")
        } else {
            return NSPredicate(value: true)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
