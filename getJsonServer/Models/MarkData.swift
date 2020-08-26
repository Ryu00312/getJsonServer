//
//  MarkData.swift
//  csv downloader
//
//  Created by Administrator on 2020/08/05.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import SwiftUI
import RealmSwift

class MarkData: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var shopCode: Int = 0
    @objc dynamic var markName: String = ""
    
    convenience init(
        id: Int,
        shopCode: Int,
        markName: String){
        self.init()
        self.id = id
        self.shopCode = shopCode
        self.markName = markName
    }
}
