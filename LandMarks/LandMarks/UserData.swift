//
//  UserData.swift
//  LandMarks
//
//  Created by SHU on 11/30/19.
//  Copyright © 2019 SHU. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
  @Published  var showFavoritesOnly = false
   @Published var landmarks = landmarkData
     @Published var profile = Profile.default
    
}

