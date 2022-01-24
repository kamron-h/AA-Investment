//
//  NavTabView.swift
//  A&AInvestment
//
//  Created by Kamron Hopkins on 1/19/22.
//

import SwiftUI

struct NavTabView: View {
    
    let garveyGreenColor = Color(UIColor(displayP3Red: 0.0, green: 0.4, blue: 0.10, alpha: 1))
    let bloodredColor = Color(UIColor(displayP3Red: 0.70, green: 0.0, blue: 0.12, alpha: 1))
    let afrikanGoldColor = Color(UIColor(displayP3Red: 0.97, green: 0.73, blue: 0.0, alpha: 1))
    
    var body: some View {
        TabView {
            Properties_View()
                .tabItem {
                    Image(systemName: "camera.filters")
                    Text("Properties")
                }
            Submission_View()
                .tabItem {
                    Image(systemName: "video")
                    Text("Submit")
                }
            ContactUs_View()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Contact Us")
                }
            NavView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("More...")
                }
        }
        .accentColor(garveyGreenColor)
    }
}



//Created to preview ARRAY of images in swipe/tabview style
struct ProjectImages_TabView : View {
    //Array of the images as URL strings
    @State var projectImages : [String]
    
    var body: some View {
        TabView {
            //Placing each image as a tab with hidden labels
            //& converting URL to UIImage before displaying w/ .load()
            ForEach(projectImages, id: \.self) { image in
                Text("image")
                    .tabItem {
                        Image(systemName: "paperclip")
                    }
                    .tag(image.count)
            }
            
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}




struct NavTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavTabView()
    }
}
