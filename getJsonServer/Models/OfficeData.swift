//
//  Prefecture.swift
//  getJsonServer
//
//  Created by Administrator on 2020/08/20.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import SwiftUI
import RealmSwift

class OfficeData: Object,Identifiable {
    private static var realm = try! Realm()
    @objc dynamic var officeCode: String = ""
    @objc dynamic var officeName: String = ""
    @objc dynamic var identifier: String = ""
    @objc dynamic var prefectureCode: String = ""
    @objc dynamic var isSelected: Bool = false
    
    override class func primaryKey() -> String? {"officeCode"}
    
    convenience init(
        officeCode: String,
        officeName: String,
        identifier: String,
        prefectureCode: String,
        isSelected: Bool){
        self.init()
        self.officeCode = officeCode
        self.officeName = officeName
        self.identifier = identifier
        self.prefectureCode = prefectureCode
        self.isSelected = isSelected
    }
    
    static func all() -> Results<OfficeData> {
        return realm.objects(OfficeData.self)
    }
    
    static func getOfficeByPrefectureCode(prefectureCode:String) -> Results<OfficeData>{
        let predicate = NSPredicate(format: "prefectureCode == %@",prefectureCode)
        return realm.objects(OfficeData.self).filter(predicate).sorted(byKeyPath: "officeCode", ascending: true)
    }
}
