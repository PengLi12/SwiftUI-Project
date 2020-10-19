//
//  ContentView.swift
//  SwiftUITestProject
//
//  Created by mac mini 2 on 2020/10/13.
//

import SwiftUI

struct ContentViewLandmarkDetail: View {
    
    @EnvironmentObject var userData: UserData
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where:{
            $0.id == landmark.id
        })!
    }
    
    
    var landmark: Landmark
    
    @State var isPeresented = false
    @State var isHikeView = false
    
    var body: some View {
        VStack {
            
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
                .onTapGesture(count: 1, perform: {
                    self.isPeresented = true
                }).sheet(isPresented: $isPeresented, content: {
                    Badge()
                })
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "heart")
                                .foregroundColor(.gray)
                        }
                    }
//                    NavigationLink(
//                        destination: HikeView(hike: hikeData[0]),
//                        label: {
//                            Text("Navigate")
//                        })
                    NavigationLink(
                        destination: PageView(features.map { FeatureCard(landmark: $0) }),
                        label: {
                            Text("Navigate")
                        })
//                    Button(action: {
//                        self.isHikeView = true
//                    }, label: {
//                        Text("Hike")
//                    }).sheet(isPresented: $isHikeView, content: {
//                        HikeView(hike: hikeData[0])
//                    })
                }
                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewLandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
            .previewDisplayName("iPhone XS Max")
    }
}
