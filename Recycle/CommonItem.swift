//
//  CommonItems.swift
//  Recycle
//
//  Created by Amy Alsaydi on 11/23/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import Foundation

enum ItemType: String { // rawValue
    case plastic
    case glass
    case aluminum
}

struct CommonItem {
    var itemName: String
    var itemType: ItemType
    var instrustions: String

    static let itemList: [CommonItem] = [
        CommonItem(itemName: "Shampoo Bottle", itemType: .plastic, instrustions: "After a quick rinse, check the bottom of the bottle for a triangle or other recycling symbol that indicates what type of other plastic category you can group the bottle into. Most will be plastics #1 and #2, which are commonly accepted by recyclers. Then simply put it out for curbside pickup or take it to your nearest recycling center."),
        CommonItem(itemName: "Water Bottle", itemType: .plastic, instrustions: """
Put the water bottle cap back on after consuming (Separated caps can reek havoc on equipment).
Crush your bottle. This allows fore more space to be saved at the processing facility, reducing the need for expansion.

Do not rinse thoroughly.
You don’t need to spend extra time rinsing out bottles that might have some liquid inside of them. Just make sure they’re empty and that you place them in a recycling bin.

No bags please!
Bagged items prevent the process from being completed and adds an extra step to the recycle process.

Recycle the outer packaging.
If you buy plastic water bottles from the store, they usually have a plastic outer wrapper that holds them in place.  Please separate this from the plastic bottles being recycles. The plastic film can be dropped off at participating grocery stores such as Fry’s and Safeway to be processed along with any other plastic grocery bags or packaging.
"""),
        CommonItem(itemName: "Food Container", itemType: .plastic, instrustions: "xyc"),
        CommonItem(itemName: "Glass jar", itemType: .glass, instrustions: "yft"),
        CommonItem(itemName: "Food Can", itemType: .aluminum, instrustions: "yyy"),
        CommonItem(itemName: "Soda Can", itemType: .aluminum, instrustions: "zzz")]
 
   static func getSections() -> [[CommonItem]] {
        
    let sortedItems = itemList.sorted { $0.itemType.rawValue > $1.itemType.rawValue}
    
    let uniqueTypes: Set<String> = Set(sortedItems.map { $0.itemType.rawValue })

    var sectionsArr = Array(repeating: [CommonItem](), count: uniqueTypes.count)
    
    var currentIndex = 0
    var currentType = sortedItems.first?.itemType.rawValue ?? "xyz"
    
    for item in sortedItems {
        if item.itemType.rawValue == currentType {
            sectionsArr[currentIndex].append(item)
        } else {
            currentIndex += 1
            currentType = item.itemType.rawValue
            sectionsArr[currentIndex].append(item)
        }
    }
    
    return sectionsArr
    }
}
