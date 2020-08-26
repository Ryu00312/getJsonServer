//
//  SelectOfficeView.swift
//  getJsonServer
//
//  Created by Administrator on 2020/08/20.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import SwiftUI
import RealmSwift

struct SelectShopView: View {
//    @ObservedObject var fetcher = JsonGetter()
    var officeCode:String
    var body: some View {
            VStack{
            List{
                //選択可能なリストにする必要がある
                ForEach(ShopData.getOfficeByOfficeCode(officeCode: officeCode),id: \.shopCode){
                        shopData in NavigationLink(destination: ContentView()){
                            Text(shopData.shopName)
                        }
                    }
                }
            }
                .navigationBarTitle(Text("店所一覧"),displayMode: .inline)
            .navigationBarHidden(false)
            .padding()
    }
}
