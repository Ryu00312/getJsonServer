//
//  Prefecture.swift
//  getJsonServer
//
//  Created by Administrator on 2020/08/20.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import SwiftUI
import RealmSwift

class PrefectureData: Object,Identifiable {
    private static var realm = try! Realm()
    @objc dynamic var prefectureCode: String = ""
    @objc dynamic var prefectureName: String = ""
    @objc dynamic var isSelected: Bool = false
    
    override class func primaryKey() -> String? {"prefectureCode"}
    
    convenience init(
        prefectureCode: String,
        prefectureName: String,
        isSelected: Bool){
        self.init()
        self.prefectureCode = prefectureCode
        self.prefectureName = prefectureName
        self.isSelected = isSelected
    }
    
    static func all() -> Results<PrefectureData> {
        return realm.objects(PrefectureData.self)
    }
}
