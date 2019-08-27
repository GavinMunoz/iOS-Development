//
//  Item.swift
//  Todoey
//
//  Created by TTA Student on 8/15/19.
//  Copyright © 2019 TTA Student. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date? = Date()
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
