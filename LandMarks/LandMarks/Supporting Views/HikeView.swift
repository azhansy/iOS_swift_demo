//
//  HikeView.swift
//  LandMarks
//
//  Created by SHU on 11/30/19.
//  Copyright © 2019 SHU. All rights reserved.
//

import SwiftUI


extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct HikeView: View {
    var hike: Hike
      @State private var showDetail = false
      
      var body: some View {
          VStack {
              HStack {
                  HikeGraph(hike: hike, path: \.elevation)
                      .frame(width: 50, height: 30)
                      .animation(nil)
                  
                  VStack(alignment: .leading) {
                      Text(verbatim: hike.name)
                          .font(.headline)
                      Text(verbatim: hike.distanceText)
                  }
                  
                  Spacer()

                  Button(action: {
                    withAnimation{
                        self.showDetail.toggle()
                    }
                  }) {
                      Image(systemName: "chevron.right.circle")
                          .imageScale(.large)
                          .rotationEffect(.degrees(showDetail ? 90 : 0))
                          .padding()
                  }
              }

              if showDetail {
                  HikeDetail(hike: hike)
              }
          }
      }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
       VStack {
                   HikeView(hike: hikeData[0])
                       .padding()
                   Spacer()
               }
    }
}
