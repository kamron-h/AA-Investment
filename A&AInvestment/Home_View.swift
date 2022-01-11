//
//  Home_View.swift
//  A&AInvestment
//
//  Created by Kamron Hopkins on 1/10/22.
//

import SwiftUI

struct Home_View: View {
    
    
    let propertiesList : [Property] = [
    
    Property(
        id: "kndlkjsdnvfsdfxcbnlkdfn",
        timestamp: Date(),
        date: Date().description,
        author: "Uhoh",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "1429 Ethiopia Drive",
        price: 999999,
        approved: true,
        expired: false,
        sold: false,
        imageUrl: "panther_1"),
    
    Property(
        id: "kndlkjsdnvfsertdfnlkdfn",
        timestamp: Date(),
        date: Date().description,
        author: "Abi",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "149 Kemet Drive",
        price: 999999,
        approved: true,
        expired: false,
        sold: false,
        imageUrl: "panther_1"),
    
    Property(
        id: "kndlkjsdnvfsdfgbdfnlkdfn",
        timestamp: Date(),
        date: Date().description,
        author: "Nkrumba",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "7352 Thebes Road",
        price: 999999,
        approved: true,
        expired: false,
        sold: false,
        imageUrl: "panther_1"),
    
    Property(
        id: "kndlkjsdnvfsdsdfnlkdfn",
        timestamp: Date(),
        date: Date().description,
        author: "Garvey",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "Somali Land, Apt. 18 B",
        price: 999999,
        approved: true,
        expired: false,
        sold: false,
        imageUrl: "panther_1"),
    
    Property(
        id: "kndlkjsdnvfsdnhngffnlkdfn",
        timestamp: Date(),
        date: Date().description,
        author: "Patrice",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "1010 Duce Drive",
        price: 999999,
        approved: true,
        expired: false,
        sold: false,
        imageUrl: "panther_1"),
    
    Property(
        id: "kndlkjsdnvfsfhfddfnlkdfn",
        timestamp: Date(),
        date: Date().description,
        author: "Guevera",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "1818 Liberation Square",
        price: 999999,
        approved: true,
        expired: false,
        sold: false,
        imageUrl: "panther_1"),
    
    Property(
        id: "kndlkjsdnvfsdfnlkddfvfn",
        timestamp: Date(),
        date: Date().description,
        author: "Ramephese",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "Garvey Stoop",
        price: 999999,
        approved: true,
        expired: false,
        sold: false,
        imageUrl: "panther_1"),
    ]
    
    var body: some View {
        
        ScrollView {
            ForEach(propertiesList) { item in
                PropertyWidget(id: item.id,timestamp: item.timestamp, date: item.date, author: item.author, authorEmail: item.authorEmail, authorPhone: item.authorPhone, title: item.title, price: item.price, approved: item.approved, expired: item.expired, sold: item.sold, imageUrl: item.imageUrl)
            }
        }
        
    }
}

struct PropertyWidget : View {
    
    @State var id : String
    @State var timestamp : Date
    @State var date : String
    
    @State var author : String
    @State var authorEmail : String?
    @State var authorPhone : String
    @State var title : String
    @State var price : Int
    @State var approved : Bool
    @State var expired : Bool
    @State var sold : Bool
    @State var imageUrl : String
    
    var body: some View {
                
        NavigationLink(destination: PropertyDetail_View(id: $id,timestamp: $timestamp, date: $date, author: $author, authorEmail: $authorEmail, authorPhone: $authorPhone, title: $title, price: $price, approved: $approved, expired: $expired, sold: $sold, imageUrl: $imageUrl)) {
            
            
            VStack {
                VStack {
                    Image(imageUrl)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Spacer(minLength: -0.1)
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
            }
            
        }
        .cornerRadius(12)
        .padding(5)
        .clipped()
        
    }
    
    
    
}


struct Property : Identifiable {
    var id: String
    
    
    let timestamp : Date
    let date : String
    
    let author : String
    let authorEmail : String?
    let authorPhone : String
    let title : String
    let price : Int
    let approved : Bool
    let expired : Bool
    let sold : Bool
    let imageUrl : String
    
}


struct Home_View_Previews: PreviewProvider {
    static var previews: some View {
        Home_View()
            .preferredColorScheme(.dark)
    }
}
