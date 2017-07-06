//
//  DBTree.swift
//  TransferInformation
//
//  Created by intern on 06/07/2017.
//  Copyright © 2017 intern. All rights reserved.
//

import UIKit
import RealmSwift

class DBTree: Object {
    dynamic var idCard=0
    let Events = List <DBEvent>()
}
