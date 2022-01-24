//
//  Submission_View.swift
//  A&AInvestment
//
//  Created by Kamron Hopkins on 1/12/22.
//

import SwiftUI
import PhotosUI

struct Submission_View: View {
    
    let screenSize = UIScreen.main.bounds.size
    
    let afrikanGoldColor = Color(UIColor(displayP3Red: 0.97, green: 0.73, blue: 0.0, alpha: 1))
    let garveyGreenColor = Color(UIColor(displayP3Red: 0.0, green: 0.4, blue: 0.10, alpha: 1))
    let bloodredColor = Color(UIColor(displayP3Red: 0.70, green: 0.0, blue: 0.12, alpha: 1))
    let darkMoonGrayColor = Color(UIColor(displayP3Red: 0.17, green: 0.17, blue: 0.17, alpha: 1))
    
    @State var projectCreationDate: Date = Date()
    
    @State var projectApproved: Bool = false
    @State var projectExpired: Bool = false
    
    @State var projectAuthorUUID: UUID = UUID()
    @State var projectAuthorProfileImage: String = ""
    @State var projectName: String = ""
    @State var projectDaysLeft: Int = 0
    @State var projectSector: String = ""
    @State var projectState: String = ""
    
    @State var projectStarred: Bool = false
    @State var projectCampaignLength: Int = 0
    @State var projectDetails: String = ""
    @State var projectPlansForUse: String = ""
    @State var projectAskingAmount: String = ""
    //    @State var projectVideoURL: String? = ""
    
    @State private var isEditing = false
    //    @State private var presentedSheet = false
    @State private var showSheet = false
    
    //Used with videoPlayerView
    @State var showVideoPicker: Bool = false
    @State var url: URL?
    
    //Used for PHPicker
    @State private var isVideoPresented: Bool = false
    @State private var isImagePresented: Bool = false
    @State var pickerResult: [UIImage] = []
    
    
    var config: PHPickerConfiguration  {
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.filter = .images //images, videos, livePhotos...
        config.selectionLimit = 3 //0 => any, set 1-2-3 for hard limit
        return config
    }
    
    //Used for project details texteditor
    @State var projectDetailsForm: String = String("  Explain, why your asking for support.. Tell us about what your plan is and the steps you intend to take? ")
    @State var needforUseTextEditor: String = String("  How will you use the support from the resistence to achieve your goal?")
    
    
    
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                VStack(spacing: nil, content: {
                    Text("Submit a Property")
                        .font(.custom("Rawkbrush", size: 40))
                        .foregroundColor(bloodredColor)
                    Spacer(minLength: 20)
                    Button(action: {
                        showSheet = true
                        
                    }, label: {
                        Text("(Please Read Guidelines Here)")
                            .foregroundColor(Color.orange)
                    })
                        .padding(.bottom, -10)
                        .sheet(isPresented: $showSheet, content: {
//                            GuidelinesView()
                        })
                })
                
                newProjectFormView(
                    projectAskingAmount: $projectAskingAmount,
                    projectName: $projectName,
                    projectDetails: $projectDetailsForm,
                    needforUseTextEditor: $needforUseTextEditor,
                    projectSector: $projectSector,
                    projectState: $projectState,
                    projectCampaignLength: $projectCampaignLength,
                    isEditing: $isEditing,
                    pickerResult: $pickerResult)
                    .frame(minWidth: screenSize.width*0.98, minHeight: screenSize.height*1.3, alignment: .center)
                
                VStack {
                    
                    Button("Upload Up To 3 Images") {
                        if pickerResult != [] {
                            pickerResult = []
                        }
                        isImagePresented.toggle()
                    }.sheet(isPresented: $isImagePresented) {
                        PhotoPicker(configuration: self.config,
                                    pickerResult: $pickerResult,
                                    isPresented: $isImagePresented)
                        
                    }.font(.custom("Rawkbrush", size: 26))
                        .foregroundColor(garveyGreenColor)
                        .frame(minWidth: 200, idealWidth: 300, maxWidth: .infinity, alignment: .top)
                        .padding(.top, -30)
                        .padding(.bottom, 30)
                    
                    Divider()
                    VStack {
                        //Need to use url of OW commercial
                        //                PlayerContainerView(player: AVPlayer(url: url ?? URL(string: "https://bit.ly/3m76rT5")!))
                        //                    .aspectRatio(contentMode: .fit)
                        //                    .sheet(isPresented: $showVideoPicker) {
                        //                        ImagePicker(isShown: $showVideoPicker, url: $url)
                        //                    }
                        
//                        VideoPickerView()
//
//                        if (showVideoPicker) {
//                            ImagePicker(isShown: $showVideoPicker, url: $url)
//                        }
                    }.frame(width: screenSize.width*0.97, alignment: .center)
                    Spacer(minLength: 52)
                    projectSubmitButton(
                        projectAuthorUUID: $projectAuthorUUID,
                        projectAskingAmount: $projectAskingAmount,
                        projectTitle: $projectName,
                        projectDetails: $projectDetails,
                        needforUseTextEditor: $projectDetails,
                        projectSector: $projectSector,
                        projectState: $projectState,
                        projectLength: $projectCampaignLength,
                        projectCreationDate: $projectCreationDate,
                        projectDaysLeft: $projectDaysLeft,
                        projectStarred: $projectStarred,
                        projectApproved: $projectApproved,
                        projectExpired: $projectExpired,
                        projectAuthorProfileImage: $projectAuthorProfileImage,
                        projectPlansForUse: $projectPlansForUse,
                        imagePickerResult: $pickerResult)
                }
            }
            
            
        }
        //        .navigationBarTitle(Text("Add a Project"))
        .onTapGesture(perform: {
            hideKeyboard()
            //Used with ProjectDetails Form Texteditor
            if projectDetailsForm == "" {
                projectDetailsForm = "  Explain, why your asking for support.. Tell us about what your plan is and the steps you intend to take? "
            } else if projectDetailsForm == " " {
                projectDetailsForm = "  Explain, why your asking for support.. Tell us about what your plan is and the steps you intend to take? "
            }
            //Used with NeedsforUse Form Texteditor
            if needforUseTextEditor == "" {
                needforUseTextEditor = "  How will you use the support from the resistence to achieve your goal?"
            } else if needforUseTextEditor == " " {
                needforUseTextEditor = "  How will you use the support from the resistence to achieve your goal?"
            }
        })
    }
    
}

struct newProjectFormView : View {
    
    let darkMoonGrayColor = Color(UIColor(displayP3Red: 0.17, green: 0.17, blue: 0.17, alpha: 1))
    
    @Binding var projectAskingAmount: String
    @Binding var projectName: String
    @Binding var projectDetails: String
    @Binding var needforUseTextEditor: String
    
    @Binding var projectSector: String
    @Binding var projectState: String
    @Binding var projectCampaignLength: Int
    
    @Binding var isEditing : Bool
    
    
    let listOfSectors = [
        
        "Agriculture", "Accommodation", "Financial", "Ourstory", "Technolgy",
        "Education", "Basic Essentials", "Manufacturing", "Media", "Real Estate",
        "Engineering", "Medical", "Mining", "Construction", "Other Services",
        "Spirituality", "Legal",
        
    ]
    
    let listOfStates = [
        "AL", "AK", "AZ", "AR", "CA",
        "CO", "CT", "DE", "DC", "FL", "GA",
        "HI", "ID", "IL", "IN", "IA",
        
        "KS", "KY", "LA", "ME", "MD",
        "MT", "NE", "NV", "NH", "NJ",
        "NM", "NY", "NC", "ND", "OH",
        
        "OK", "OR", "PA", "PR", "RI", "SC",
        "SD", "TN", "TX", "UT", "VT",
        "VA", "WA", "WV", "WI", "WY",
        
    ]
    
    
    @Binding var pickerResult: [UIImage]
    
    
    let bloodredColor = Color(UIColor(displayP3Red: 0.70, green: 0.0, blue: 0.12, alpha: 1))
    let garveyGreenColor = Color(UIColor(displayP3Red: 0.0, green: 0.4, blue: 0.10, alpha: 1))
    
    var body : some View {
        
        Form {
            
            List {
                
                //Project Name Textfield
                TextField(
                    "  Asking Amount",
                    text: $projectAskingAmount
                ) { isEditing in
                    self.isEditing = isEditing
                } onCommit: {
                    //                        validate(name: username)
                }
                .frame(minWidth: 200, idealWidth: 300, maxWidth: .infinity, minHeight: 20, idealHeight: 40, maxHeight: .infinity, alignment: .center)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                //Project Name Textfield
                TextField(
                    "  Project Name",
                    text: $projectName
                ) { isEditing in
                    self.isEditing = isEditing
                } onCommit: {
                    //                        validate(name: username)
                }
                .frame(minWidth: 200, idealWidth: 300, maxWidth: .infinity, minHeight: 20, idealHeight: 40, maxHeight: .infinity, alignment: .center)
                .autocapitalization(.words)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                //                    Text(projectName)
                //                        .foregroundColor(isEditing ? .red : .blue)
                
                VStack {
                    //Dropdown Sector Menu
                    Menu("Choose a Sector") {
                        ScrollView {
                            
                            ForEach(listOfSectors, id: \.self) { sector in
                                Button("\(sector)", action: {
                                    self.projectSector = sector
                                    print(sector)
                                    
                                })
                            }
                            
                        }
                        
                    }
                    .font(.custom("Rawkbrush", size: 26))
                    .foregroundColor(garveyGreenColor)
                    
                    Menu("Choose a State") {
                        ScrollView {
                            
                            ForEach(listOfStates, id: \.self) { usState in
                                Button("\(usState)", action: {
                                    self.projectState = usState
                                    print(usState)
                                })
                            }
                        }
                    }
                    .font(.custom("Rawkbrush", size: 26))
                    .foregroundColor(garveyGreenColor)
                    .padding()
                    
                    Menu("Campaign Length") {
                        Button("45 Days", action: {
                            self.projectCampaignLength = 45
                            print(projectCampaignLength)
                        })
                        Button("75 Days", action: {
                            self.projectCampaignLength = 75
                            print(projectCampaignLength)
                        })
                        Button("90 Days", action: {
                            self.projectCampaignLength = 90
                            print(projectCampaignLength)
                        })
                        
                    }
                }
                .font(.custom("Rawkbrush", size: 26))
                .foregroundColor(garveyGreenColor)
                .frame(maxWidth: .infinity ,maxHeight: .infinity , alignment: .center)
                .padding()
                
                
                //Project Name Textfield
                ProjectDetailsForm_Editor(projectDetails: $projectDetails)
                    .cornerRadius(9)
                
                //Project Name Textfield
                NeedforUseTextEditor(needforUseTextEditor: $needforUseTextEditor)
                    .cornerRadius(9)
                
            }
            
            LazyHStack(alignment: .center) {
                ForEach(pickerResult, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width*0.26, height: UIScreen.main.bounds.width*0.28, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .tabItem {
                            Image(systemName: "paperclip")
                        }
                }
            }
            .frame(height: UIScreen.main.bounds.width*0.28, alignment: .center)
            .background(darkMoonGrayColor)
            
            
            
        }
        
    }
}


struct ProjectDetailsForm_Editor: View {
    
    let moonGrayColor = Color(UIColor(displayP3Red: 0.30, green: 0.30, blue: 0.30, alpha: 1))
    
    @Binding var projectDetails: String
    @State var isEditing = false
    @State private var tapCount = 0
    @State private var tapEditingCount = 0
    @State private var maxHeightAdjustment = 30
    
    var body: some View {
        TextEditor(text: $projectDetails)
            .frame(minWidth: 200, idealWidth: 300, maxWidth: .infinity, minHeight: 20, idealHeight: 200, maxHeight: 400, alignment: .center)
            .multilineTextAlignment(.leading)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.sentences)
        //            .border(Color(UIColor.gray))
            .foregroundColor(isEditing ? .white : moonGrayColor)
        //            .textFieldStyle(RoundedBorderTextFieldStyle())
            .lineSpacing(5)
            .onTapGesture {
                //For height adjustment of frame on-tapped
                if projectDetails == "  Explain, why your asking for support.. Tell us about what your plan is and the steps you intend to take? " {
                    projectDetails = " "
                }
                //                if tapCount == 0 {
                //                    projectDetailsForm = ""
                //                    tapCount += 1
                //                } else if tapCount == 3 {
                ////                    fullText = ""
                //                    tapCount = 0
                //                }
                //Need to delete or alter the below code!!!
                //Correct code checks whether fulltext = "" or user input.
                if tapEditingCount == 0 {
                    isEditing.toggle()
                    tapEditingCount += 1
                } else {
                    isEditing = true
                }
                
            }
            .background(Color.black)
        
        
    }
}


struct NeedforUseTextEditor: View {
    
    let moonGrayColor = Color(UIColor(displayP3Red: 0.30, green: 0.30, blue: 0.30, alpha: 1))
    
    @Binding var needforUseTextEditor: String
    @State var isEditing = false
    @State private var tapCount = 0
    @State private var tapEditingCount = 0
    
    var body: some View {
        TextEditor(text: $needforUseTextEditor)
            .frame(minWidth: 200, idealWidth: 300, maxWidth: .infinity, minHeight: 20, idealHeight: 200, maxHeight: 400, alignment: .center)
            .multilineTextAlignment(.leading)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.sentences)
        //            .border(Color(UIColor.gray))
            .foregroundColor(isEditing ? .white : moonGrayColor)
        //            .textFieldStyle(RoundedBorderTextFieldStyle())
            .lineSpacing(5)
            .onTapGesture {
                if needforUseTextEditor == "  How will you use the support from the resistence to achieve your goal?" {
                    needforUseTextEditor = " "
                }
                //                if tapCount == 0 {
                //                    tapCount += 1
                //                } else if tapCount == 3 {
                //                    tapCount = 0
                //                }
                //Need to delete or alter the below code!!!
                //Correct code checks whether fulltext = "" or user input.
                if tapEditingCount == 0 {
                    isEditing.toggle()
                    tapEditingCount += 1
                } else {
                    isEditing = true
                }
                
            }
            .background(Color.black)
        
        
    }
}


struct projectSubmitButton : View {
    
//    @ObservedObject private var campaign = Home_ViewModel()
    
    @Binding var projectAuthorUUID: UUID//Not needed - Unused
    @Binding var projectAskingAmount: String
    @Binding var projectTitle: String
    @Binding var projectDetails: String
    @Binding var needforUseTextEditor: String
    
    @Binding var projectSector: String
    @Binding var projectState: String
    @Binding var projectLength: Int
    
    @Binding var projectCreationDate: Date
    @State var projectExpirationDate: Date = Date() //Unless altered, <-todaysdate->
    @Binding var projectDaysLeft: Int
    
    @Binding var projectStarred: Bool
    @Binding var projectApproved: Bool
    @Binding var projectExpired: Bool
    
    @Binding var projectAuthorProfileImage: String
    @Binding var projectPlansForUse: String
    @Binding var imagePickerResult: [UIImage]
    //    @Binding private var projectVideoURL: String?
    @State var navLinkActive = false
    
    //TODO: Create needforUseTextEditor and new textfield
    func combineFullDescription() {
        projectDetails = "   \(projectDetails)"
        print("Combined details with plans for use..")
        print(projectDetails)
    }
    
    @State private var goesToHome: Bool = false
    
    var body: some View {
        
        
        
        if projectAskingAmount.count > 2 && projectTitle.count > 5
            && projectSector != "" && projectState != "" && projectLength != 0
        {
            NavigationLink(
                destination: NavView(),
                isActive: $goesToHome) {
                    Button(action: {
                        goesToHome = true
                        
//                        if Auth.auth().currentUser != nil {
//                            //TODO: Need to update description/plans4Use/videoUrl for PRODUCTION
//                            campaign.addProjectData(
//                                creationDate: Date(),
//                                expirationDate: "\(changeExpDATE(length: projectLength))", //REMOVE
//                                approvalDate: Date(),
//                                authorID: Auth.auth().currentUser?.uid ?? "Error, User not logged in.. (AddProjectForm_View)",
//                                author: "",
//                                profileImageUrl: "",
//                                title: projectTitle,
//                                sector: projectSector,
//                                location: projectState,
//                                images: imagePickerResult,
//                                description: "We are asking the community to unite its resouces to provide ourselves with the essential needs for African/Black Empowerment.", //needforUseTextEditor,
//                                plansForUse: "To compete with European brands and empower OurPeople...", //projectPlansForUse,
//                                videoURL: "",
//                                daysLeft: projectDaysLeft,
//                                expired: "\(projectExpired)",
//                                approved: "\(projectApproved)",
//                                starred: "\(projectStarred)",
//                                length: "\(projectLength)",
//                                askingAmount: projectAskingAmount,
//                                raisedAmount: 0)
//
//
//                            print("PROJECT  Data sent to firestore - AddProjectForm")
//                            print("User Logged In - Project Added - AddProjectForm")
//
//                        } else {
//                            print("User Not Logged In - AddProjectForm")
//                        }
                        
                    }) {
                        
                        VStack(content: {
                            Text("Submit for Review")
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                        })
                            .frame(minWidth: 30, idealWidth: 40, maxWidth: .infinity, minHeight: 20, idealHeight: 60, maxHeight: 71, alignment: .center)
                            .background(Color(UIColor(displayP3Red: 0.70, green: 0.0, blue: 0.12, alpha: 1)))
                            .cornerRadius(8.0)
                        
                    }
                }
                .padding(10.0)
            
            
        } else {
            
            Button(action: {
                print("Couln't submit project because fields aren't filled out properly")
            }, label: {
                VStack(content: {
                    Text("Submit for Review")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                })
                    .frame(minWidth: 30, idealWidth: 40, maxWidth: .infinity, minHeight: 20, idealHeight: 60, maxHeight: 71, alignment: .center)
                    .background(Color(UIColor(displayP3Red: 0.70, green: 0.0, blue: 0.12, alpha: 1)))
                    .cornerRadius(8.0)
                //            .onTapGesture {
                //                combineFullDescription()
                //                print(projectAuthorUUID, projectAskingAmount, projectName, projectDetails)
                //            }
            })
                .padding(10.0)
        }
    }
}

struct Submission_View_Previews: PreviewProvider {
    static var previews: some View {
        Submission_View()
    }
}
