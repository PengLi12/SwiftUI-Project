//
//  LandmarkList.swift
//  SwiftUITestProject
//
//  Created by mac mini 2 on 2020/10/13.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
//        NavigationView{
            List {
                
                Toggle(isOn: $userData.showFavoriteOnly) {
                    Text("Favorite only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoriteOnly || landmark.isFavorite {
                        NavigationLink(
                            destination: ContentViewLandmarkDetail(landmark: landmark)
                                .environmentObject(self.userData)
                        ){
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
//            List(landmarkData) { landmark in
//                if !self.showFavoriteOnly || landmark.isFavorite {
//                    NavigationLink(
//                        destination: ContentViewLandmarkDetail(landmark: landmark)) {
//                            LandmarkRow(landmark: landmark)
//                        }
//                }
//            }
            
            .navigationTitle(Text("Landmark"))
        }
        
//        .edgesIgnoringSafeArea(.top)
//    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkList()
                .environmentObject(UserData())
        }
//        ForEach(["iPhone XS Max"], id: \.self) {deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
//        .environmentObject(UserData())
    }
}














































