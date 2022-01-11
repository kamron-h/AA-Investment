//
//  NavView.swift
//  A&AInvestment
//
//  Created by Kamron Hopkins on 1/10/22.
//

import SwiftUI

struct NavView: View {
    var body: some View {
        NavigationView {
            
            
            NavigationLink(destination: Home_View()) {
                Text("Home")
            }
            
            NavigationLink(destination: NewInvestment_View()) {
                Text("Submit a Property")
            }
        }
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
