//
//  HikeView.swift
//  SwiftUITestProject
//
//  Created by mac mini 2 on 2020/10/15.
//

import SwiftUI

struct HikeView: View {
    
    var hike: Hike
    
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                    .animation(nil)
                
//                    Image("timg")
//                        .frame(width: 50, height: 50)
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .clipShape(Circle())
//                        .background(Color.red)
//                        .overlay(
//                            Circle().stroke(Color.white, lineWidth: 4))
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                Spacer()
                Button(action: {
//                    withAnimation(.easeInOut(duration: 4)) {
                        self.showDetail.toggle()
//                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
//                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                }
            }
            if showDetail {
                HikeDetail(hike: hike)
                    .padding(EdgeInsets(top: 60, leading: 0, bottom: 0, trailing: 0))
//                    .transition(AnyTransition.move(edge: .trailing))
            }
        }
        .navigationBarTitle(Text("测速"))
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
//            VStack {
                HikeView(hike: hikeData[0])
                    
//                Spacer()
//            }
        }
    }
}
