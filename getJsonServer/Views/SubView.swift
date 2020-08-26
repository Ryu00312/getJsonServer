//
//  SubView.swift
//  csv downloader
//
//  Created by Administrator on 2020/08/07.
//  Copyright © 2020 Swift-Beginners. All rights reserved.
//

import SwiftUI
import RealmSwift

struct SubView: View {
     @ObservedObject private var viewModel = ViewModel()
       var body: some View {
           List {
            ForEach(viewModel.itemEntities, id: \.id) { itemEntity in
                Text(itemEntity.text)
                }
           }
       }
}

class ViewModel: ObservableObject {
    @Published var itemEntities: Results<TelephonePole> = TelephonePole.all()
}
