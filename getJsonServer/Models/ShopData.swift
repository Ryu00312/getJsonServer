//
//  ShopData.swift
//  csv downloader
//
//  Created by Administrator on 2020/08/05.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import SwiftUI
import RealmSwift

class ShopData: Object {
    private static var realm = try! Realm()
    @objc dynamic var shopCode: String = ""
    @objc dynamic var shopName: String = ""
    @objc dynamic var officeCode: String = ""
    @objc dynamic var isSelected: Bool = false
    
    
    override class func primaryKey() -> String? {"shopCode"}
    
    convenience init(
        shopCode: String,
        shopName: String,
        officeCode: String,
        isSelected: Bool){
        self.init()
        self.shopCode = shopCode
        self.shopName = shopName
        self.officeCode = officeCode
        self.isSelected = isSelected
    }
    
    static func all() -> Results<ShopData> {
        return realm.objects(ShopData.self)
    }
    
    static func getOfficeByOfficeCode(officeCode:String) -> Results<ShopData>{
        let predicate = NSPredicate(format: "officeCode == %@",officeCode)
        return realm.objects(ShopData.self).filter(predicate).sorted(byKeyPath: "shopCode", ascending: true)
    }
    
   
}
