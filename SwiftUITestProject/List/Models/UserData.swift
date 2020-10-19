//
//  UserData.swift
//  SwiftUITestProject
//
//  Created by mac mini 2 on 2020/10/14.
//

import SwiftUI
import Combine


final class UserData: ObservableObject {
   @Published var showFavoriteOnly = false
   @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
