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
            
            List {
                NavigationLink(destination: Home_View()) {
                    Text("View Properties")
                        .bold()
                }
                
                NavigationLink(destination: NewInvestment_View()) {
                    Text("Submit a Property")
                        .bold()
                }
                
                NavigationLink(destination: NewInvestment_View()) {
                    Text("Review/Approval")
                        .bold()
                }
                
                NavigationLink(destination: NewInvestment_View()) {
                    Text("Terms of Service")
                        .bold()
                }
                
                NavigationLink(destination: NewInvestment_View()) {
                    Text("Contact Us")
                        .bold()
                }
                
                NavigationLink(destination: NewInvestment_View()) {
                    Text("Sign In / Sign Up")
                        .bold()
                }
            }
        }
        .navigationTitle(Text("Navigation"))
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
            .preferredColorScheme(.dark)
    }
}
