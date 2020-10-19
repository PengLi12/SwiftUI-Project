//
//  CircleImage.swift
//  SwiftUITestProject
//
//  Created by mac mini 2 on 2020/10/13.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .frame(width: 200, height: 200, alignment: .center)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
//            .onTapGesture(count: 2, perform: {
//                print("hello")
//            })
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
