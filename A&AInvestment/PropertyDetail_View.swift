//
//  PropertyDetail_View.swift
//  A&AInvestment
//
//  Created by Kamron Hopkins on 1/10/22.
//

import SwiftUI

struct PropertyDetail_View: View {
    @Binding var id : String
    
    @Binding var timestamp : Date
    @Binding var date : String
    
    @Binding var author : String
    @Binding var authorEmail : String?
    @Binding var authorPhone : String
    @Binding var title : String
    @Binding var price : Int
    @Binding var approved : Bool
    @Binding var expired : Bool
    @Binding var sold : Bool
    @Binding var imageUrl : String
    
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                VStack {
                    Image(imageUrl)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                HStack {
                    VStack{
                        Spacer()
                        Text(title)
                            .bold()
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(minWidth: 140, maxWidth: .infinity, alignment: .center)
                        //                            .background(.white)
                            .padding(5)
                        Spacer()
                        HStack {
                            Text(author)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .frame(minWidth: 140, maxWidth: .infinity, alignment: .leading)
                            //                                .background(.white)
                                .padding(.leading, 15)
                        }
                        Spacer()
                    }
                    
                    Spacer()
                    VStack{
                        Spacer()
                        Text("00/00/00")
                            .foregroundColor(.white)
                            .frame(minWidth: 50, maxWidth: 100, alignment: .center)
                        //                            .background(.white)
                            .padding(.trailing, 3)
                        Spacer()
                        Text(String(price))
                            .bold()
                            .foregroundColor(.green)
                            .frame(minWidth: 50, maxWidth: 100, alignment: .center)
                        //                            .background(.white)
                            .padding(.trailing, 3)
                        Spacer()
                    }
                    .padding(5)
                }
                .background(Color.gray)
                .padding(.bottom, 31)
                
                
                VStack {
                    
                    HStack {
                        Spacer()
                        Text("Call Us")
                            .bold()
                            .foregroundColor(.green)
                        Spacer()
                        Text("Leave a Message")
                            .bold()
                            .foregroundColor(.yellow)
                        Spacer()
                    }
                    Spacer(minLength: 25)
                    Text("Description :")
                    Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?")
                        .multilineTextAlignment(.center)
                        .frame(height: 600, alignment: .top)
                        .padding(.horizontal, 8)
                    Spacer()
                }
                
            }

        }
        
        
    }
}

struct PropertyDetail_View_Previews: PreviewProvider {
    static var previews: some View {
        PropertyDetail_View(id: .constant("id"), timestamp: .constant(Date()), date: .constant("Date"), author: .constant("Date"), authorEmail: .constant("true"), authorPhone: .constant("Date"), title: .constant("Date"), price: .constant(9999), approved: .constant(true), expired: .constant(true), sold: .constant(true), imageUrl: .constant("Date"))
            .preferredColorScheme(.dark)
    }
}
