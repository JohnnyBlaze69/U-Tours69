//
//  SearchDestinationView.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 11/01/24.
//

import SwiftUI

struct SearchDestinationView: View {
    @State private var searchTxt: String = ""
    var body: some View {
        VStack(spacing: Size.shared.screenHeight() * 0.05){
            HStack {
                Button(action: {
                    print("Debug: Back Button tap")
                }, label: {
                    Image(systemName: "multiply")
                         .bold()
                         .frame(alignment: .leading)
                         .frame(width: 20, height: 20)
                         .foregroundColor(.black)
                })
                .buttonStyle(.borderless)
                
                Spacer().frame(width: Size.shared.screenWidth() * 0.30)
                
                Text("Search")
                    
                    .font(.system(size: 20))
                    .frame(alignment: .center)
                Spacer()
            }
            .padding(.top, Size.shared.screenHeight() * 0.05)
            .frame(width: Size.shared.screenWidth() * 0.90)
            
            HStack {
               Image(systemName: "magnifyingglass")
                    .bold()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.gray)
                TextField("Search", text: $searchTxt)
            }
           
        }
        .navigationBarHidden(true)
        .frame(width: Size.shared.screenWidth() * 0.90)
        Divider()
        Spacer()
    }
}

struct SearchDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDestinationView()
    }
}
