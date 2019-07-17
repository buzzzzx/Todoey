//
//  Category.swift
//  Todoey
//
//  Created by jediii on 2019/7/17.
//  Copyright © 2019 Jediii. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name = ""
    var items = List<Item>()
}
