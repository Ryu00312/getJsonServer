//
//  ContentView.swift
//  csv downloader
//
//  Created by Administrator on 2020/07/31.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import SwiftUI
import UIKit
import RealmSwift

struct ContentView: View {
@ObservedObject var observedObjectDownloadManager = DownloadManager()
    
@State var isPresentedSubView:Bool = false
var body: some View {
        Button(action: {
            print("Button Tapped")
            
            // process if this is first time to launch this app
            let defaults = UserDefaults.standard

            if defaults.bool(forKey: "firstLaunch") {
                 
                 // Some Process will be here
                   let filePath = "https://mybacket001.s3-ap-northeast-1.amazonaws.com/AAA_shop.csv"
               self.observedObjectDownloadManager.startDownload(_filename: filePath)
                          
                   let telephonePoles = loadTelephonePoleCSV()
                   let realm = try! Realm()
                   try! realm.write{
                       realm.add(telephonePoles)
                   }
                 // off the flag to know if it is first time to launch
                defaults.set(false, forKey: "firstLaunch")
               }

            self.isPresentedSubView.toggle()
            
            }){
            Text("Button")
        }.sheet(isPresented: $isPresentedSubView) {
            SubView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
