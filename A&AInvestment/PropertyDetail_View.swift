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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PropertyDetail_View_Previews: PreviewProvider {
    static var previews: some View {
        PropertyDetail_View(id: .constant("id"), timestamp: .constant(Date()), date: .constant("Date"), author: .constant("Date"), authorEmail: .constant("true"), authorPhone: .constant("Date"), title: .constant("Date"), price: .constant(9999), approved: .constant(true), expired: .constant(true), sold: .constant(true), imageUrl: .constant("Date"))
    }
}
