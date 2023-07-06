//
//  TabViewModel.swift
//  WhatzTheSitch
//
//  Created by Harshil Patel on 12/02/22.
//

import SwiftUI

class TabViewModel: ObservableObject {
    
    @Published var currentTab = "Home"
    
    // Detail Data...
    @Published var showDetail: Bool = false
}
