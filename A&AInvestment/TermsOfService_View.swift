//
//  TermsOfService_View.swift
//  A&AInvestment
//
//  Created by Kamron Hopkins on 1/12/22.
//

import SwiftUI

struct TermsOfService_View: View {
    //Color Scheme
    let bloodRedColor = Color(UIColor(displayP3Red: 0.70, green: 0.0, blue: 0.12, alpha: 1))
    let afrikanGoldColor = Color(UIColor(displayP3Red: 0.97, green: 0.73, blue: 0.0, alpha: 1))
    let garveyGreenColor = Color(UIColor(displayP3Red: 0.0, green: 0.4, blue: 0.10, alpha: 1))
    let grayMoonColor = Color(UIColor(displayP3Red: 0.55, green: 0.55, blue: 0.55, alpha: 1))
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ScrollView(content: {
            VStack(alignment: .center, spacing: nil, content: {
                Text("Terms of Service")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(grayMoonColor)
            })
                .frame(maxWidth: screenWidth * 0.95, minHeight: screenHeight * 0.07, alignment: .center)
            
            Spacer()
            VStack(alignment: .center, spacing: nil, content: {
                Text("Chapter 1 : Privacy")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(grayMoonColor)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                
                Text("   "+"Quisque fringilla gravida mauris, et vehicula mi pretium nec. Maecenas sollicitudin nunc mauris, quis rutrum velit ornare vel. Morbi rutrum efficitur dui et tincidunt. Donec a consequat massa, a porta lorem. Etiam purus enim, sagittis et varius non, pulvinar ut nisl. Ut quis justo tincidunt ligula volutpat pretium. Cras magna lorem, finibus ut venenatis eu, pretium at velit. Phasellus eu pretium nulla. Vestibulum maximus eu dolor quis posuere. Morbi non enim non odio vestibulum suscipit cursus a nulla. Maecenas non efficitur lectus, at euismod leo. Nulla posuere velit sit amet convallis porta. Pellentesque purus quam, semper vel magna id, lobortis porta justo.")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(grayMoonColor)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                
            })
                .frame(maxWidth: screenWidth * 0.95, minHeight: screenHeight * 0.07, alignment: .center)
            
            
            VStack(alignment: .center, spacing: nil, content: {
                Text("Chapter 2 : Service/Fees")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(grayMoonColor)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                
                Text("   "+"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(grayMoonColor)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                
            })
                .frame(maxWidth: screenWidth * 0.95, minHeight: screenHeight * 0.07, alignment: .center)
            
            
            VStack(alignment: .center, spacing: nil, content: {
                Text("Chapter 3 : Trademark Infringement")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(grayMoonColor)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                
                Text("   "+"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(grayMoonColor)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                
            })
                .frame(maxWidth: screenWidth * 0.95, minHeight: screenHeight * 0.07, alignment: .center)
            
            
            Spacer()
        })
    }
}

struct TermsOfService_View_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfService_View()
    }
}
