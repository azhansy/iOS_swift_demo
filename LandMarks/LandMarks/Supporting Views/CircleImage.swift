//
//  CircleImage.swift
//  LandMarks
//
//  Created by SHU on 11/30/19.
//  Copyright © 2019 SHU. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image:Image
    
    var body: some View {
       image
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white,lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
