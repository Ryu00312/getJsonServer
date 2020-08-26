//
//  SelectOfficeView.swift
//  getJsonServer
//
//  Created by Administrator on 2020/08/20.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import SwiftUI
import RealmSwift

struct SelectOfficeView: View {
    var prefectureCode:String
    var body: some View {
            VStack{
            List{
                ForEach(OfficeData.getOfficeByPrefectureCode(prefectureCode: prefectureCode),id: \.officeCode){
                    //選択したタイミングでDownload Managerを呼びたい
                    office in NavigationLink(destination: SelectShopView(officeCode: office.officeCode )){
                    Text(office.officeName)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("事務所一覧"),displayMode: .inline)
            .navigationBarHidden(false)
            .padding()
    }
}

