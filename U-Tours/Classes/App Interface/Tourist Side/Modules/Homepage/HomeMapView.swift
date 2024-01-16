//
//  HomeMapView.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 12/01/24.
//

import SwiftUI
import MapKit


struct HomeMapView: View {
    var body: some View {
        HomeMapContent()
    }
}

struct HomeMapContent: View {
    @State private var showFilterByView: Bool = false
    @State private var sheetInitialOffsetY: CGFloat = UIScreen.main.bounds.height * 0.23
    @State private var sheetCurrentOffsetY: CGFloat = 0
    @State private var sheetFinalOffsetY: CGFloat = 0
    
    @State private var sheetAtMiddleOffsetY: CGFloat = UIScreen.main.bounds.height * 0.03
    @State private var sheetAtBottomOffsetY: CGFloat = UIScreen.main.bounds.height * 0.50
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation(.spring()) {
                    
                    sheetCurrentOffsetY = value.translation.height
                    //print("\(sheetCurrentOffsetY)")
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    if sheetCurrentOffsetY > 200 {
                        sheetFinalOffsetY = sheetAtBottomOffsetY
                    }
                    else if sheetCurrentOffsetY < -250 {
                        sheetFinalOffsetY = sheetAtMiddleOffsetY
                    }
                    sheetCurrentOffsetY = 0
                }
            }
    }
    
    var body: some View {
        ZStack{
            VStack(spacing:0){
                VStack{
                    Text("Explore")
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                        .onTapGesture {
                            showFilterByView.toggle()
                        }
                    // Debug Offset: Text("\(sheetCurrentOffsetY)")
                    
                    TourKeywordsView()
                        .padding(.leading, 10)
                }
                .background(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: Size.shared.screenHeight() * 0.10)
                
                HomeMap()
                    .ignoresSafeArea()
                
            }

            HomeToursView()
                .background(Color.white)
                .cornerRadius(20)
                .offset(y: sheetInitialOffsetY)
                .offset(y: sheetCurrentOffsetY)
                .offset(y: sheetFinalOffsetY)
                .gesture(dragGesture)
            
            if showFilterByView {
                FilterByView(showFilterByView: $showFilterByView)
            }
            
        }
    }
}

struct HomeToursView: View {
    init() {
        UIScrollView.appearance().bounces = false
    }
    @State private var searchTxt: String = ""
    @State private var showAdvancedSearch: Bool = false
    let customTxtFldHeight: CGFloat = {
        return UIScreen.main.bounds.height * 0.05
    }()
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 40, height: 5)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
//                    .gesture(dragGesture)

                // Advanced Search
                Button{
                    withAnimation(.linear(duration: 0.2)) {
                        showAdvancedSearch.toggle()
                    }
                } label: {
                    Image(systemName: "magnifyingglass")
                        .frame(width: 20, height: 20)
                    Text("Advanced Search")
                        .font(.system(size: 20))
                }
                .padding(.vertical)
                .foregroundColor(.blue)
                
                if showAdvancedSearch {
                    TextField("Advaned Search...", text: $searchTxt)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .frame(width: Size.shared.screenWidth() * 0.90, height: customTxtFldHeight)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 1)
                        )
                }
                
                // Popular Tours
                HStack {
                    Text("Popular Tours")
                        .font(.system(size: 25))
                        .bold()
                    Spacer()
                    Button{
                        print("Debug: See All tap")
                    } label: {
                        Text("See All")
                            .font(.system(size: 12))
                            .foregroundColor(.blue)
                    }
                }
                .padding(.vertical)
                .frame(width: Size.shared.screenWidth() * 0.95)
                
                DestinationCardsView()
                    .frame(width: Size.shared.screenWidth() * 0.95)
                
                // Featured
                HStack {
                    Text("Featured")
                        .font(.system(size: 25))
                        .bold()
                    Spacer()
                    
                    Button{
                        print("Debug: See All tap")
                    } label: {
                        Text("See All")
                            .font(.system(size: 12))
                            .foregroundColor(.blue)
                    }
                }
                .padding(.vertical)
                .frame(width: Size.shared.screenWidth() * 0.95)
                
                DestinationCardsView()
                    .frame(width: Size.shared.screenWidth() * 0.95)
                
            }
            .background(Color.white)
            .cornerRadius(20)
           // Spacer()
        }
    }
}


struct HomeMap: View {
    var body: some View {
        VStack(spacing:0){
            Map(coordinateRegion: .constant(.connaughtPlace))
        }
    }
}


struct HomeMapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMapView()
    }
}

