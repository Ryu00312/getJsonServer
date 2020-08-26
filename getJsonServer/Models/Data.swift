//
//  Data.swift
//  csv downloader
//
//  Created by Administrator on 2020/08/05.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit

let telephonePoleData: [TelephonePole] = loadTelephonePoleCSV()
var areaName : String = ""

func loadTelephonePoleCSV() -> [TelephonePole] {
    var telephonePoles: [TelephonePole] = []
    let path = URL(fileURLWithPath: NSHomeDirectory() + "/Library/Csv/AAA_shop.csv")
        do {
            areaName = path.lastPathComponent.components(separatedBy: "_")[0]
            let csvString = try String(contentsOf: path, encoding: .shiftJIS)
            var csvLines = csvString.components(separatedBy: "\r\n")
            
            csvLines.removeFirst()
            for line in csvLines{
                let data = line.components(separatedBy: ",")
                
                if data.count == 13 {
                    let latData = data[10].components(separatedBy: "/")
                    let lat = Double(latData[0])! + (Double(latData[1])! * 60 + Double(latData[2])!) / 3600
                    let lonData = data[11].components(separatedBy: "/")
                    let lon = Double(lonData[0])! + (Double(lonData[1])! * 60 + Double(lonData[2])!) / 3600
                    let latitude = lat - 0.00010695 * lat + 0.000017464 * lon + 0.0046017
                    let longitude = lon - 0.000046038 * lat + 0.000083043 * lon + 0.010040
                    let telephonePole = TelephonePole(
                        id: Int(data[0])!,
                        shopCode: Int(data[2])!,
                        markNo: Int(data[3])!,
                        markName: data[4],
                        poleNo: data[5],
                        latitude: latitude,
                        longitude: longitude)
                    telephonePoles.append(telephonePole)
                }
            }
        } catch {
            print("ERROR")
        }
    return telephonePoles
}


func pickupMarkData() -> [MarkData] {
    let markDataList: [MarkData] = telephonePoleData.map({
        MarkData(id: $0.markNo, shopCode: $0.shopCode, markName: $0.markName)
        }).removingDuplicates()
    return markDataList
}
