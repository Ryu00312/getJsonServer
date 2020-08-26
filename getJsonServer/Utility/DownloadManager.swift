//
//  DownloadManager.swift
//  csv downloader
//
//  Created by Administrator on 2020/08/03.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import SwiftUI

class DownloadManager: NSObject, URLSessionDownloadDelegate, ObservableObject{
    var success = false
    func startDownload(_filename: String){
        let identifier = "hoge"
        let configuration = URLSessionConfiguration.background(withIdentifier: identifier)
        let session = URLSession(configuration: configuration,delegate: self,delegateQueue: nil)
        
        let requestURL = URL(string:_filename)!
        let task = session.downloadTask(with: requestURL)
        print("ダウンロード開始")
        task.resume()
        
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("ダウンロード完了")
        
        let fileManager = FileManager.default
        self.createFolder()
        let libraryPath = NSHomeDirectory() + "/Library/Csv"
        let targetURL = URL(fileURLWithPath: libraryPath + "/AAA_shop.csv")
        
        try? fileManager.removeItem(at: targetURL)
        
        try? fileManager.moveItem(at: location, to: targetURL)
        

    }
    
    private func createFolder(){
        let libraryPath = NSHomeDirectory() + "/Library/Csv"
        do{
            if FileManager.default.fileExists(atPath: libraryPath){
                print("フォルダーがすでに存在するのでスキップ")
                return
            }
            try FileManager.default.createDirectory(atPath: libraryPath, withIntermediateDirectories: true, attributes: nil)
            print("success")
        }catch{
            print("error")
        }
    }
    
    //ダウンロードの進捗具合
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let parcentage = Int((Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)) * 100)
        print("進捗: \(parcentage)%")
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let err = error {
              print("エラーが発生しました: \(err)")
        }
    }
    
    
}
