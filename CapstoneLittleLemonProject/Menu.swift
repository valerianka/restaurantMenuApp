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
    @State var hasLoadedMenuData: Bool = false
    @State var categories:[Bool] = [true,true,true,true]
    var body: some View {
        VStack(alignment: .leading) {
            HeroSectionView()
            TextField("Search menu", text: $searchText)
                .frame(minWidth:0, maxWidth:250)
                .foregroundColor(Color.gray)
                .background(Color.white)
                .border(Color.white)
                .cornerRadius(25)
                .padding(.bottom, 8)
            Text("ORDER FOR DELIVERY!")
                .font(.system(.headline))
                .padding(.leading, 8)
                .padding(.top, 8)
            HStack{
                menuCategoryButton(category: "Starters", isOn: isStarters, categories: $categories)
                menuCategoryButton(category: "Mains", isOn: isMains, categories: $categories)
                menuCategoryButton(category: "Desserts", isOn: isDesserts, categories: $categories)
                menuCategoryButton(category: "Drinks", isOn: isDrinks, categories: $categories)
            }
            .padding(.leading, 8)
            .padding(.top, 8)
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors())
            { (dishes: [Dish]) in
                List{
                    ForEach(dishes, id:\.id) { dish in
                        if (categories[getCategoryInd(category:dish.category!)]) {
                            MenuItemView(dish: dish)
                        }
                    }
                }
            }
        }
        .onAppear() {
            if (!hasLoadedMenuData) {
                getMenuData(urlStr: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
                hasLoadedMenuData = true
            }
        }
    }
    func getCategoryInd(category: String) -> Int {
        var res: Int
        switch category {
        case "starters": res = 0
        case "mains": res = 1
        case "desserts": res = 2
        case "drinks": res = 3
        default: res = 0
        }
        return res
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
                        dish.itemDescription = menuItem.itemDescription
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
        }
        return NSPredicate(value: true)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
