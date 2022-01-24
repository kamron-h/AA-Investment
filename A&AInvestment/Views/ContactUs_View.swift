//
//  ContactUs.swift
//  A&AInvestment
//
//  Created by Kamron Hopkins on 1/12/22.
//

import SwiftUI

struct ContactUs_View: View {
    
//    @ObservedObject var contactModel = ContactMessage_ViewModel()
    
    var screenSize = UIScreen.main.bounds
    
    let bloodRedColor = Color(UIColor(displayP3Red: 0.70, green: 0.0, blue: 0.12, alpha: 1))
    let afrikanGoldColor = Color(UIColor(displayP3Red: 0.97, green: 0.73, blue: 0.0, alpha: 1))
    let garveyGreenColor = Color(UIColor(displayP3Red: 0.0, green: 0.4, blue: 0.10, alpha: 1))
    
    @State private var contactName: String = ""
    @State private var contactEmail: String = ""
    @State private var contactSubject: String = ""
    @State private var contactMessage: String = ""
    @State private var isEditing = false
    @State private var topSpacing : CGFloat = 0.0
    @State private var bottomSpacing : CGFloat = 15.0
    
    @State var fullText: String = "Message"
    
    private func owa() {
        if isEditing == true {
            fullText = ""
        }
    }
    
    var body: some View {
        ScrollView(content: {
            VStack {
                
                Spacer(minLength: 31)
                
                Text("Have suggestions for improvement, want to show some love, or have some issues that you need resolving? Send us a message..")
                //FONT CUSTOMIZATION - Need "minimum" size
                    .font(.custom("Nosifer-Regular", size: 17))
                    .bold()
                    .foregroundColor(garveyGreenColor)
                    .multilineTextAlignment(.center)
                Text("\n\n")
                Spacer(minLength: topSpacing)
                
                VStack {
                    VStack {
//                        ///Project Name Textfield
//                        if Auth.auth().currentUser != nil {
//                            NameTextEditor(contactName: $contactName)
//                                .padding(.bottom, 10)
//                            EmailTextEditor(contactEmail: $contactEmail)
//                                .padding(.bottom, 10)
//                                .onAppear {
//                                    topSpacing = 50.0
//                                    bottomSpacing = 75.0
//                                }
//                        }
                        SubjectTextEditor(contactSubject: $contactSubject)
                            .padding(.bottom, 10)
                        MessageTextEditor(contactMessage: $contactMessage)
                            .padding(.bottom, 10)
                    }
                    .frame(minWidth: 200, idealWidth: 280, maxWidth: .infinity, minHeight: 100, idealHeight: 400, maxHeight: .infinity, alignment: .center)
                    
                }
                
                
                //                Divider()
                Spacer(minLength: bottomSpacing)
                Button(action: {
//                    //authorID is configured in the viewmodel
//                    contactModel.addMessageData(
//                        id: "",
//                        ipAddress: getIPAddress(),
//                        timestamp: Date(),
//                        messageDate: shortExpDate(expDate: changeExpDATE(length: 0)),
//                        messageAuthorID: "",
//                        messageSenderName: contactName,
//                        messageSenderEmail: contactEmail,
//                        messageSubject: contactSubject,
//                        messageDescription: contactMessage,
//                        messageViewed: false,
//                        messageStarred: false)
                }) {
                    VStack(content: {
                        Text("Submit")
                        //                            .font(.custom("Rawkbrush", size: 33))
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                    })
                        .frame(minWidth: 30, idealWidth: 40, maxWidth: .infinity, minHeight: 20, idealHeight: 60, maxHeight: 71, alignment: .center)
                        .background(Color(UIColor(displayP3Red: 0.70, green: 0.0, blue: 0.12, alpha: 1)))
                        .cornerRadius(8.0)
                    
                }
                Spacer()
            }
            .padding(.horizontal)
            
        })
            .navigationBarTitle(Text("Contact Us"))
        
            .onTapGesture {
                hideKeyboard()
            }
    }
}




struct NameTextEditor: View {
    
    private let screenSize = UIScreen.main.bounds
    let grayMoonColor = Color(UIColor(displayP3Red: 0.55, green: 0.55, blue: 0.55, alpha: 1))
    let afrikanGoldColor = Color(UIColor(displayP3Red: 0.97, green: 0.73, blue: 0.0, alpha: 1))
    
    @Binding var contactName : String
    @State var isEditing = false
    
    var body: some View {
        
        Text("  Your Name :")
            .font(.custom("Lacquer-Regular", size: 15))
            .foregroundColor(afrikanGoldColor)
            .frame(width: screenSize.width * 0.9, alignment: .leading)
            .padding(.top, 10)
        //Project Name Textfield
        TextField(
            "  The Honorable . . .",
            text: $contactName
        ) { isEditing in
            self.isEditing = isEditing
        } onCommit: {
            //                        validate(name: username)
        }
        .autocapitalization(.words)
        .foregroundColor(isEditing ? .red : grayMoonColor)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        
        
    }
}


struct EmailTextEditor: View {
    
    private let screenSize = UIScreen.main.bounds
    let grayMoonColor = Color(UIColor(displayP3Red: 0.55, green: 0.55, blue: 0.55, alpha: 1))
    let afrikanGoldColor = Color(UIColor(displayP3Red: 0.97, green: 0.73, blue: 0.0, alpha: 1))
    
    @Binding var contactEmail : String
    @State var isEditing = false
    
    var body: some View {
        Text("  Your Email :")
            .font(.custom("Lacquer-Regular", size: 15))
            .foregroundColor(afrikanGoldColor)
            .frame(width: screenSize.width * 0.9, alignment: .leading)
            .padding(.top, 10)
        //Project Name Textfield
        TextField(
            "  yourname@.com",
            text: $contactEmail
        ) { isEditing in
            self.isEditing = isEditing
        } onCommit: {
            //                        validate(name: username)
        }
        .autocapitalization(.none)
        .keyboardType(.emailAddress)
        .foregroundColor(isEditing ? .red : grayMoonColor)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}


struct SubjectTextEditor: View {
    
    private let screenSize = UIScreen.main.bounds
    let grayMoonColor = Color(UIColor(displayP3Red: 0.55, green: 0.55, blue: 0.55, alpha: 1))
    let afrikanGoldColor = Color(UIColor(displayP3Red: 0.97, green: 0.73, blue: 0.0, alpha: 1))
    
    @Binding var contactSubject : String
    @State var isEditing = false
    
    var body: some View {
        
        Text("  The Subject :")
            .font(.caption)
            .foregroundColor(afrikanGoldColor)
            .frame(width: screenSize.width * 0.9, alignment: .leading)
            .padding(.top, 10)
        //Project Name Textfield
        TextField(
            "  Unwanted Property",
            text: $contactSubject
        ) { isEditing in
            self.isEditing = isEditing
        } onCommit: {
            //                        validate(name: username)
        }
        .frame(minWidth: 200, idealWidth: 300, maxWidth: .infinity, minHeight: 20, idealHeight: 40, maxHeight: .infinity, alignment: .center)
        .autocapitalization(.words)
        .foregroundColor(isEditing ? .red : grayMoonColor)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        
        
    }
}


struct MessageTextEditor: View {
    
    private let screenSize = UIScreen.main.bounds
    let grayMoonColor = Color(UIColor(displayP3Red: 0.55, green: 0.55, blue: 0.55, alpha: 1))
    let afrikanGoldColor = Color(UIColor(displayP3Red: 0.97, green: 0.73, blue: 0.0, alpha: 1))
    
    @Binding var contactMessage : String
    @State var isEditing = false
    
    var body: some View {
        
        Text("  Your Message :")
            .font(.caption)
            .foregroundColor(afrikanGoldColor)
            .frame(width: screenSize.width * 0.9, alignment: .leading)
            .padding(.top, 10)
        TextEditor(text: $contactMessage)
            .foregroundColor(isEditing ? .red : grayMoonColor)
            .frame(minWidth: 200, idealWidth: 300, maxWidth: .infinity, minHeight: 180, idealHeight: 200, maxHeight: 400, alignment: .center)
            .multilineTextAlignment(.leading)
            .autocapitalization(.sentences)
            .border(Color.gray.opacity(0.2))
        //            .onAppear {
        //                contactMessage = " Your message...."
        //            }
        //            .onTapGesture {
        //                if contactMessage == " Your message...." {
        //                    contactMessage = ""
        //                } else if contactMessage == " Your message...." {
        //
        //                }
        //
        //            }
            .padding(.bottom, 46)
    }
}





struct ContactUs_View_Previews: PreviewProvider {
    static var previews: some View {
        ContactUs_View()
    }
}
