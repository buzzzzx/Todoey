//
//  Item.swift
//  Todoey
//
//  Created by jediii on 2019/7/17.
//  Copyright © 2019 Jediii. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title = ""
    @objc dynamic var isChecked = false
    @objc dynamic var dateCreated = Date()
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
