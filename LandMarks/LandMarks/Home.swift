//
//  Home.swift
//  LandMarks
//
//  Created by SHU on 11/30/19.
//  Copyright © 2019 SHU. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    var categories: [String: [Landmark]] {
        .init(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }
    
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    
    
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }

    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: LandmarkList()) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(self.userData)
                
//                Text("User Profile")
            }
        }
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
//        landmarks[0].image(forSize: 250).resizable()
        landmarks[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
        .environmentObject(UserData())
    }
}

//test git
