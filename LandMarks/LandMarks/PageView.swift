//
//  PageView.swift
//  LandMarks
//
//  Created by SHU on 12/2/19.
//  Copyright © 2019 SHU. All rights reserved.
//

import SwiftUI


struct PageView<Page: View>: View {
    
    @State var currentPage = 0
    
    var viewControllers: [UIHostingController<Page>]

    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
                   PageViewController(controllers: viewControllers, currentPage: $currentPage)
                   PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                       .padding(.trailing)
               }
    }
}

struct PageView_Preview: PreviewProvider {
    static var previews: some View {
        PageView(features.map { FeatureCard(landmark: $0) })
        .aspectRatio(3/2, contentMode: .fit)
    }
}
