//
//  SwiftUITestProjectApp.swift
//  SwiftUITestProject
//
//  Created by mac mini 2 on 2020/10/13.
//

import SwiftUI

@main
struct SwiftUITestProjectApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentViewLandmarkDetail()
//            LandmarkList()
            CategoryHome()
                .environmentObject(UserData())
//            CircleImage()
        }
    }
}
