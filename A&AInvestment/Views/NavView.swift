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
                NavigationLink(destination: EditProfileView()) {
                    Text("Edit Profile")
                        .bold()
                }
                
                Spacer()
                
                NavigationLink(destination: ContactUs_View()) {
                    Text("Contact Us")
                        .bold()
                }
                
                NavigationLink(destination: ContactUs_View()) {
                    Text("Rate Us")
                        .bold()
                }
                
                Spacer()
                
                NavigationLink(destination: ReviewApproval_View()) {
                    Text("Privacy Statement")
                        .bold()
                }
                
                NavigationLink(destination: TermsOfService_View()) {
                    Text("Terms of Service")
                        .bold()
                }
                
                Spacer()
                
                NavigationLink(destination: NavView()) {
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
