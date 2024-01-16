//
//  ContentView.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 08/01/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        OnboardingView()
//        NativeTabView()
//            .onAppear {
//                let tabBarAppearance = UITabBarAppearance()
//                tabBarAppearance.configureWithOpaqueBackground()
//                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
//            }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}


struct NativeTabView: View {
    @State private var showSheet: Bool = true
    @State private var selectedDetent = PresentationDetent.custom(CustomLargeDetent.self)
    var body: some View {
        TabView {
            HomeMapView()
                .tabItem {
                    Label("", image: "ic_explore")
                }
            MyToursView()
                .tabItem {
                    Label("", image: "ic_myTour")
                }
            ProfileView()
                .tabItem {
                    Label("", image: "ic_user_profile")
                }
        }
    }
}


struct CustomSmallDetent: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        return Size.shared.screenHeight() * 0.10
    }
}

struct CustomLargeDetent: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        return Size.shared.screenHeight() * 0.65
    }
}
