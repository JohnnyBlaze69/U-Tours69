//
//  CustomProgressBar.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 16/01/24.
//

import SwiftUI

struct CustomProgressBar: View {
    @State private var containerWidth: CGFloat = 0
//    @State private var progressTitle: String = "0"
    let activeColor = Color(red: 30/255, green: 162/255, blue: 207/255)
    var maxWidth: Double {
        return min(containerWidth / CGFloat(goal) * CGFloat(step), containerWidth)
    }
    
    
//    private let goal = 3
//    @State private var step = 1
    let goal: Int = 3
    @Binding var step: Int
    @Binding var progressTitle: String
//    @Binding var goal: Int
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                GeometryReader { geo in
                    RoundedRectangle(cornerRadius: 60)
                        .fill(Color(.systemGray6))
//                        .foregroundColor(.clear)
                        .onAppear {
                            containerWidth = geo.size.width
                        }
                }

                RoundedRectangle(cornerRadius: 60)
                    .stroke(.white, lineWidth: 1)

                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 60)
                        .fill(activeColor)

                    Text("\(progressTitle)")
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 3, leading: 6, bottom: 3, trailing: 6))
                        .background(
                            RoundedRectangle(cornerRadius: 60)
                                .fill(activeColor)
                        )
                }
//                .padding(2)
                .frame(minWidth: maxWidth)
                .fixedSize()
            }
            .fixedSize(horizontal: false, vertical: true)
            .onAppear {
                progressTitle = "\(step) / \(goal)"
            }
        }
    }
}

struct CustomProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressBar(step: .constant(1), progressTitle: .constant("1"))
    }
}
