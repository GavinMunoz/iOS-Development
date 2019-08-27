//
//  Category.swift
//  Todoey
//
//  Created by TTA Student on 8/15/19.
//  Copyright © 2019 TTA Student. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    
    let items = List<Item>()
    
}
