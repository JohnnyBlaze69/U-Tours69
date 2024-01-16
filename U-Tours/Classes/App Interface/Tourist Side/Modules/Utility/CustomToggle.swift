//
//  CustomToggle.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 09/01/24.
//

import Foundation
import SwiftUI

struct CustomToggle: ToggleStyle {
    
    var systemImage: String = "checkmark"
//    var activeColor: Color = .green
    let activeColor = Color(red: 30/255, green: 162/255, blue: 207/255)
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(configuration.isOn ? activeColor: Color(.systemGray5))
            .overlay {
                Circle()
                    .fill(.white)
                    .padding(3)
                    .overlay {
                        Text(configuration.isOn ? "ON" : "")
                            .bold()
                            .font(.system(size: 13))
                            .foregroundColor(configuration.isOn ? activeColor : Color(.systemGray5))
//                        Image(systemName: systemImage)
//                            .foregroundColor(configuration.isOn ? activeColor: Color(.systemGray5))
                    }
                    .offset(x: configuration.isOn ? 15: -15)
            }
            .frame(width: 62, height: 35)
            .onTapGesture {
                withAnimation(.spring()) {
                    configuration.isOn.toggle()
                }
            }
    }
}
