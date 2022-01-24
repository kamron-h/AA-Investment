//
//  EditProfileView.swift
//  A&AInvestment
//
//  Created by Kamron Hopkins on 1/19/22.
//

import SwiftUI
//import Firebase

struct EditProfileView: View {
    
//    @ObservedObject var userInfo = User_ViewModel()
    
    //Color Scheme
    let bloodRedColor = Color(UIColor(displayP3Red: 0.70, green: 0.0, blue: 0.12, alpha: 1))
    let afrikanGoldColor = Color(UIColor(displayP3Red: 0.97, green: 0.73, blue: 0.0, alpha: 1))
    let garveyGreenColor = Color(UIColor(displayP3Red: 0.0, green: 0.4, blue: 0.10, alpha: 1))
    let grayMoonColor = Color(UIColor(displayP3Red: 0.55, green: 0.55, blue: 0.55, alpha: 1))
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @State var showImagePicker: Bool = false
    @State var profileImage = Image("mobile_1")
    @State var selectedImage: UIImage?
    
    @State var userName: String = "Thomas Sankura"
    @State var userEmail: String = "almost@red.com"
    @State var userLocation: String = "The D.R.C."
    @State var userSubmissionCount: String = "0"  //Int
    @State var userPersonalDescription: String = "description"
    
//    let currentUserID = Auth.auth().currentUser?.uid ?? "nil"
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    
                    //Need to create code to import the UIImage to FireStore
//                    if userInfo.profileImageUrl != "blank"{
                    if profileImage != nil {
//                        Image(uiImage: userInfo.profileImageUrl.load())
                        Image("mobile_0")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(maxWidth: screenWidth * 0.75, maxHeight: screenWidth * 0.75, alignment: .center)
                            .padding(.top, 10)
                            .onTapGesture {
                                hideKeyboard()
                                //Tells view to open image picker
                                self.showImagePicker.toggle()
                            }
                    } else if selectedImage == nil {
                        profileImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(maxWidth: screenWidth * 0.75, maxHeight: screenWidth * 0.75, alignment: .center)
                            .padding(.top, 10)
                            .onTapGesture {
                                hideKeyboard()
                                //Tells view to open image picker
                                self.showImagePicker.toggle()
                            }
                    }
                }
                
                Button(action: {
                    //Tells view to open image picker
                    self.showImagePicker.toggle()
                }) {
                    Text("Upload Image")
                        .bold()
                        .foregroundColor(afrikanGoldColor)
                }
                //Tells view to open image picker
                .sheet(isPresented: $showImagePicker) {
                    ImagePickerUIView(sourceType: .photoLibrary) { image in
                        self.selectedImage = image
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 35)
                
                Spacer(minLength: 40)
                HStack {
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name : ")
                                .font(.caption)
                                .bold()
                            
                            TextField("userName", text: $userName)
                                .font(.caption2)
                                .disableAutocorrection(true)
                                .foregroundColor(.white)
                                .frame(minHeight: 30, alignment: .center)
                        }
                        .padding(.horizontal, 10)
                        Divider()
                        HStack {
                            Text("Location : ")
                                .font(.caption)
                                .bold()
                            TextField("location", text: $userLocation)
                                .font(.caption2)
                                .foregroundColor(.white)
                                .frame(minHeight: 30, alignment: .center)
                        }
                        .padding(.horizontal, 10)
                        Divider()
                        HStack {
                            Text("Projects : ")
                                .font(.caption)
                                .bold()
                            Text("userInfo")
                                .font(.caption2)
                                .foregroundColor(.white)
                                .frame(minHeight: 30, alignment: .center)
                        }
                        .padding(.horizontal, 10)
                        Divider()
                        HStack {
                            Text("Conributions : ")
                                .font(.caption)
                                .bold()
                            Text("contributions")
                                .font(.caption2)
                                .foregroundColor(.white)
                                .frame(minHeight: 30, alignment: .center)
                        }
                        .padding(.horizontal, 10)
                        Divider()
                        Text("Personal Description : ")
                            .font(.caption)
                            .bold()
                            .frame(width: screenWidth*0.94, alignment: .leading)
                        //                                .background(Color.gray)
                            .padding(.horizontal, 10)
                            .padding(.bottom)
                        TextEditor(text: $userPersonalDescription)
                            .font(.caption2)
                            .lineLimit(15)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        //                                .background(Color.red)
                            .frame(minHeight: screenWidth*0.65 , alignment: .top)
                            .padding(.horizontal, 8)
                            .padding(.leading, 5)
//                            .onAppear() {
//                                userName = userInfo.name
//                                userLocation = userInfo.location
//                                userPersonalDescription = userInfo.bio
//                            }
                        
                    }
                    .foregroundColor(grayMoonColor)
                }
                
                
                
            }.onTapGesture {
                hideKeyboard()
            }
            
            Spacer(minLength: 26)
            Button(action: {}, label: {
                Text("Save Changes")
                    .fontWeight(.heavy)
                    .frame(minWidth: 200, maxWidth: screenWidth * 0.95, maxHeight: screenWidth * 0.2, alignment: .center)
                    .foregroundColor(.black)
                    .font(.title2)
                    .background(bloodRedColor)
                    .cornerRadius(5)
                    .padding()
            })
                .frame(alignment: .center)
                .padding(.bottom, 130)
            
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
//    init() {
//        userInfo.getProfileData(userID: currentUserID)
//        userPersonalDescription = userInfo.bio
//        userName = userInfo.name
//        userLocation = userInfo.location
//        userProjectsCount = userInfo.campaigns.count.description
//        userContributionsCount = userInfo.contributions.count.description
//    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
