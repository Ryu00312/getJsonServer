//
//  JsonGetter.swift
//  getJsonServer
//
//  Created by Administrator on 2020/08/20.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON
import RealmSwift

//JSONからデコードするための構造体
struct Prefecture:Codable{
        let prefectureCode:String
        let prefectureName:String
        let offices:[Office]
}
struct Office:Codable{
            let officeCode: String
            let officeName: String
            let identifier:String
            let shops: [Shop]
        
}
struct Shop:Codable {
    let shopCode:String
    let shopName: String
}

class JsonGetter:ObservableObject{
    private let urllink = "http://localhost:3000/prefectures"
    @Published var prefectureData:[Prefecture] = []
    
    init(){
        fetchJsonData()
    }
    func fetchJsonData()  {
      AF.request(urllink).responseJSON { response in
             guard let json = response.data else{
                               return
                           }
        let prefectures = try! JSONDecoder().decode([Prefecture].self, from: json)
        let realm = try! Realm()
        for prefecture in prefectures{
            //JSON用構造体からRealm用構造体に詰め直し
            let prefectureRealm = PrefectureData(
                prefectureCode: prefecture.prefectureCode, prefectureName: prefecture.prefectureName, isSelected: false)
            
            try! realm.write{
                realm.add(prefectureRealm)
            }
            self.prefectureData = prefectures
            
            for office in prefecture.offices{
                let officeRealm = OfficeData(officeCode: office.officeCode, officeName: office.officeName, identifier: office.identifier, prefectureCode: prefecture.prefectureCode, isSelected: false)
                
                try! realm.write{
                    realm.add(officeRealm)
                }
                
                for shop in office.shops{
                    let shopRealm = ShopData(shopCode: shop.shopCode, shopName: shop.shopName,officeCode: office.officeCode, isSelected: false)
                    
                    try! realm.write{
                        realm.add(shopRealm)
                    }
                }
            }
        }
        //self.prefectureData = prefectures
        }
    }
    
}
