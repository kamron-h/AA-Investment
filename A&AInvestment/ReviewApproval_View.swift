//
//  ReviewApproval_View.swift
//  A&AInvestment
//
//  Created by Kamron Hopkins on 1/12/22.
//

import SwiftUI

struct ReviewApproval_View: View {
    
    private var screenHeight = UIScreen.main.bounds.height
    
    let bloodRedColor = Color(UIColor(displayP3Red: 0.70, green: 0.0, blue: 0.12, alpha: 1))
    
    @State private var isShowingPopover = false
    @State private var popoverCount = 0
    @State private var progressHidden = false
    
    //    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let data = Array(1...20).map { "Item \($0)" }
    
    let layout3 = [
        GridItem(.flexible()),
        
    ]
    
//    @ObservedObject var campsModel = Camps_ViewModel()
    
    var body: some View {
        
        ScrollView {
            
            if progressHidden == false {
                Spacer(minLength: screenHeight * 0.3)
                ProgressView("Loading \nYour Properties")
                    .multilineTextAlignment(.center)
                    .font(.custom("Lacquer-Regular", size: 19))
                    .foregroundColor(bloodRedColor)
                    .frame(width: 120, height: 140, alignment: .center)
                Spacer()
            }
            
//            if Auth.auth().currentUser != nil {
//
//                if progressHidden == false {
//                    Spacer(minLength: screenHeight * 0.3)
//                    ProgressView("Loading \nYour Properties")
//                        .multilineTextAlignment(.center)
//                        .font(.custom("Lacquer-Regular", size: 19))
//                        .foregroundColor(bloodRedColor)
//                        .frame(width: 120, height: 140, alignment: .center)
//                    Spacer()
//                }
//
//                ForEach(campsModel.campaignList) { item in
//
//                    PropertyItemWidget()
//                        .padding(.horizontal, 4.0)
//                        .onAppear() {
//                            progressHidden = true
//                            if item.projectExpired == false {
//                                //If the current date is Less-Than the expDate, update campaign expired field to be true
//                                if isExpired(stringExpDate: item.projectExpirationDate) {
//                                    campsModel.markConExpired(id: item.id)
//                                    print(item.projectTitle,item.id)
//                                    return
//                                }
//                                return
//                            }
//                        }
//                }
//                //            .padding(.leading, 7.5)
//                //            .padding(.trailing, 7.5)
//
//
//            } else {
//                //If user isn't a member they can't access Contribution List feature
//                Spacer()
//                Text("You must be a member to access this feature")
//                    .multilineTextAlignment(.center)
//                    .font(.custom("Lacquer-Regular", size: 19))
//                    .foregroundColor(bloodRedColor)
//                    .frame(width: 120, height: 140, alignment: .center)
//                Spacer()
//            }
        }
//        .onAppear() {
////            campsModel.getContributionData()
//        }
    }
    
    //TODO: Create a sort filter/button for videos to show projects in reverse order
    //Try to animate return transition
    //    init() {
    //        homeModel.getCampData()
    //    }
}

struct PropertyItemWidget: View {
    
//    @ObservedObject var contributionModel = Camps_ViewModel()
    
    var screenSize = UIScreen.main.bounds
    
    @State var propertyID = "Missing UID"
    @State var propertyTitle = "Wigs-N-Weaves"
    @State var propertyAuthor = "Author"
    @State var propertyAuthorID = "Author"
    @State var propertyAuthorEmail = "Author"
    @State var propertyAuthorPhone = "Author"
    @State var propertyAuthorProfileImage = "mfu1"
    @State var propertySector = "Growth"
    @State var propertyImagesUrls = ["weave1"]
    @State var propertyDescription = "Wigs-N-Weaves"
    
    @State var propertyLocation = "Location, Current"
    @State var propertyVideoURL = ""
    @State var propertyAdminResponses = ["Plans for Use..."]
    
    @State var propertyAskingAmount = 15087
    @State var propertyDepositAmount = 3847
    
    @State var propertyCampaignLength = 99
    @State var propertyCreationDate = Date()
    @State var propertyExpirationDate = ""
    @State var propertySold = false
    @State var propertyExpired = false
    @State var propertyapproved : Bool = false
    
    
    let bloodRedColor = Color(UIColor(displayP3Red: 0.70, green: 0.0, blue: 0.12, alpha: 1))
    let baliGreenColor = Color(UIColor(displayP3Red: 0.0, green: 0.55, blue: 0.0, alpha: 1))
    let amberGoldColor = Color(UIColor(displayP3Red: 1.0, green: 0.75, blue: 0.0, alpha: 1))
    let moonGrayColor = Color(UIColor(displayP3Red: 0.55, green: 0.55, blue: 0.55, alpha: 1))
    let darkMoonGrayColor = Color(UIColor(displayP3Red: 0.17, green: 0.17, blue: 0.17, alpha: 1))
    
    
    var body: some View {
        
        NavigationLink(
            destination:
                PropertyDetail_View(id: $propertyID, timestamp: $propertyCreationDate, date: $propertyExpirationDate, author: $propertyAuthor, authorEmail: $propertyAuthorEmail, authorPhone: $propertyAuthorPhone, title: $propertyTitle, price: $propertyAskingAmount, approved: $propertyapproved, expired: $propertyExpired, sold: $propertySold, imageUrl: $propertyImagesUrls),
            label: {
                VStack {
                    HStack {
                        Image("mobile_2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: screenSize.width*0.35, minHeight: screenSize.width*0.3,alignment: .trailing)
                        
                        HStack {
                            Text(propertyTitle)
                                .font(Font.custom("Lacquer-Regular", size: 20))
                                .multilineTextAlignment(.center)
                            //                                .font(Font.custom("", size: 18))
                                .foregroundColor(moonGrayColor)
                                .lineLimit(4)
                            Spacer()
                            
                        }
                        .padding()
                        
                    }
                    
                    
                    
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8.0)
                //        .padding(.bottom, 13.0)
            })
        //TODO: markExpired is running everytime the screen displays, for each contribution campaign. A if statement needs to be used to check if the the campaign Exp status is already == true. If the status is already == true the markExp func SHOULD NOT run... IF the status ISN'T == true && the camp has pasted ExpDate. markEXP() should run...
        //            .onAppear {
        //                if contributionExpired == false {
        //                    //Comapre current date w/ expDate. If the current date is Less-Than the expDate, update campaign expired field to be "TRUE"
        //                    if isExpired(stringExpDate: contributionExpirationDate) {
        //                        contributionModel.markConExpired(id: contributionID)
        //                        print("\n\nCompared Dates -> Contribution ran markExp() for : \(contributionTitle)\n\n")
        //                        print(contributionExpirationDate)
        //
        //                        return
        //                    }
        //                } else {
        //                    //Do nothing/continue...
        //                    print("\n\nChecked EXP status -> Contribution has expired, didn't run markExp() for : \(contributionTitle)\n\n")
        //                    print(contributionExpirationDate)
        //                    return
        //                                    }
        //            }
        //TODO: REMOVE UNUSED INTERPOLATION BELOW
            .navigationTitle("My Properties")
    }
}

struct ReviewApproval_View_Previews: PreviewProvider {
    static var previews: some View {
        ReviewApproval_View()
    }
}
