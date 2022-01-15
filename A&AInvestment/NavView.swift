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
                Spacer()
                NavigationLink(destination: Properties_View()) {
                    Text("View Properties")
                        .bold()
                }
                
                NavigationLink(destination: Submission_View()) {
                    Text("Submit a Property")
                        .bold()
                }
                
                NavigationLink(destination: ReviewApproval_View()) {
                    Text("Review/Approval")
                        .bold()
                }
                
                NavigationLink(destination: TermsOfService_View()) {
                    Text("Terms of Service")
                        .bold()
                }
                
                NavigationLink(destination: ContactUs_View()) {
                    Text("Contact Us")
                        .bold()
                }
                
                NavigationLink(destination: SignInUp_View()) {
                    Text("Sign In / Sign Up")
                        .bold()
                }
                Spacer()
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
