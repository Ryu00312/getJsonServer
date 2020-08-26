//
//  Array+Utils.swift
//  csv downloader
//
//  Created by Administrator on 2020/08/05.
//  Copyright © 2020 Swift-Beginners. All rights reserved.

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removingDuplicates() {
        self = self.removingDuplicates()
    }
}
