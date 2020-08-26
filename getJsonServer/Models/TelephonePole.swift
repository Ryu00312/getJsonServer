//
//  TelephonePole.swift
//  csv downloader
//
//  Created by Administrator on 2020/08/05.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import SwiftUI
import Foundation
import CoreLocation
import RealmSwift

class TelephonePole: Object, Identifiable {
    private static var realm = try! Realm()
    
    @objc dynamic var id: Int = 0
    
    @objc dynamic var shopCode: Int = 0
    
    @objc dynamic var markNo: Int = 0
    
    @objc dynamic var markName: String = ""
    
    @objc dynamic var poleNo: String = ""
    
    @objc dynamic var latitude: Double = 0.0
    
    @objc dynamic var longitude: Double = 0.0
    
    @objc dynamic var text: String{
        "\(markNo)-\(markName)-\(poleNo)"
    }
        
    override class func primaryKey() -> String? { "id" }
    override class func indexedProperties() -> [String] { ["id"] }
    convenience init(
        id: Int,
        shopCode: Int,
        markNo: Int,
        markName: String,
        poleNo: String,
        latitude:Double,
        longitude:Double
        ){
        self.init()
        self.id = id
        self.shopCode = shopCode
        self.markNo = markNo
        self.markName = markName
        self.poleNo = poleNo
        self.latitude = latitude
        self.longitude = longitude
    }
    
    static func all() -> Results<TelephonePole> {
        realm.objects(TelephonePole.self)
    }


}

