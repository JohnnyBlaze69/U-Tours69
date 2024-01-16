//
//  Size.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 08/01/24.
//

import Foundation
import SwiftUI


final class Size {
    static let shared = Size()
    private init() { }
    
    func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
}
