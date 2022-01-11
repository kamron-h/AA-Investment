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
        timestamp: Date().description,
        date: Date().description,
        author: "author",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "title",
        price: 999999,
        approved: true,
        expired: false,
        sold: false),
    
    Property(
        timestamp: Date().description,
        date: Date().description,
        author: "author",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "title",
        price: 999999,
        approved: true,
        expired: false,
        sold: false),
    
    Property(
        timestamp: Date().description,
        date: Date().description,
        author: "author",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "title",
        price: 999999,
        approved: true,
        expired: false,
        sold: false),
    
    Property(
        timestamp: Date().description,
        date: Date().description,
        author: "author",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "title",
        price: 999999,
        approved: true,
        expired: false,
        sold: false),
    
    Property(
        timestamp: Date().description,
        date: Date().description,
        author: "author",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "title",
        price: 999999,
        approved: true,
        expired: false,
        sold: false),
    
    Property(
        timestamp: Date().description,
        date: Date().description,
        author: "author",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "title",
        price: 999999,
        approved: true,
        expired: false,
        sold: false),
    
    Property(
        timestamp: Date().description,
        date: Date().description,
        author: "author",
        authorEmail: "author email",
        authorPhone: "0-000-000-0000",
        title: "title",
        price: 999999,
        approved: true,
        expired: false,
        sold: false),
    
    
    ]
    
    
    
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PropertyWidget : View {
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    
    
}


struct Property {
    
    let timestamp : String
    let date : String
    
    let author : String
    let authorEmail : String?
    let authorPhone : String
    let title : String
    let price : Int
    let approved : Bool
    let expired : Bool
    let sold : Bool
    
}


struct Home_View_Previews: PreviewProvider {
    static var previews: some View {
        Home_View()
    }
}
