//
//  SelectPrefectureView.swift
//  getJsonServer
//
//  Created by Administrator on 2020/08/12.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON
import RealmSwift

struct SelectPrefectureView: View {
    /*
        RealmからGETして描画したい。
        描画もしくはGETのタイミング問題で、LISTに何も表示されないためデータを保持しておく。
    */
    @ObservedObject var jsonGetter = JsonGetter()
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(jsonGetter.prefectureData,id: \.prefectureCode){
                        prefecture in NavigationLink(destination: SelectOfficeView(prefectureCode:prefecture.prefectureCode )){
                        Text(prefecture.prefectureName)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("都道府県一覧"),displayMode:.inline)
            .navigationBarHidden(false)
            .padding()
        }
    }
}

