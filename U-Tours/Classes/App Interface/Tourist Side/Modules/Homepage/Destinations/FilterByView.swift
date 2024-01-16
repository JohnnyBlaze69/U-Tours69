//
//  FilterByView.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 09/01/24.
//

import SwiftUI

struct FilterByView: View {
//    init() {
//        UIScrollView.appearance().bounces = false
//    }
    @State var language: String = ""
    @State var country: String = ""
    @State var location: String = ""
    @State var type: String = ""
    @State var charity: String = ""
    @State var tourGuides: String = ""
    @State var enableMobility: Bool = false
    @State var priceRange: Double = 45
    @State var travelDistance: Double = 20
    @State var routeDistance: Double = 70
    @State var time: Double = 40
    @Binding var showFilterByView: Bool
    let customHeight: CGFloat = {
        return UIScreen.main.bounds.height * 0.05
    }()
    let customWidth: CGFloat = {
        return UIScreen.main.bounds.width * 0.90
    }()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let borderColor = Color(red: 239/255, green: 239/255, blue: 239/255)
    let bodyColor = Color(red: 239/255, green: 239/255, blue: 239/255)
    let activeColor = Color(red: 30/255, green: 162/255, blue: 207/255)
    var body: some View {
        ZStack{
            VStack {
                HStack{
                    Text("Filter By")
                        .bold()
                        .font(.system(size: 30))
                    Spacer()
                    Image("ic_cross")
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            withAnimation(.linear(duration: 0.20)) {
                                showFilterByView.toggle()
                            }
                        }
                }
                .padding()
                
                Divider()
                
                FilterByListView(language: $language, country: $country, location: $location, type: $type, charity: $charity, tourGuides: $tourGuides, enableMobility: $enableMobility, priceRange: $priceRange, travelDistance: $travelDistance, routeDistance: $routeDistance, time: $time)
                    .padding(.horizontal)
                
                Divider()
                
                // Clear Btn
                HStack {
                    Button(action: {
                       print("Debug: Clear Btn tap")
                    }, label:  {
                        Text("Clear")
                            
                            .font(.system(size: 20))
                            .foregroundColor(activeColor)
                            .frame(width: 60)
                    })
                    .buttonStyle(.borderless)
                    .padding()
                    .frame(height: 55)
                    .cornerRadius(10)

                    Spacer().frame(width: width * 0.20)
                    
                    // Apply Btn
                    Button(action: {
                       print("Debug: Apply Btn tap")
                    }, label:  {
                        Text("Apply")
                            .bold()
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 60)
                    })
                    .padding([.leading, .trailing], 20)
                    .frame(height: 45)
                    .background(activeColor)
                    .cornerRadius(10)
                }
                .frame(width: customWidth)
            }
//            .padding()
            .frame(width: width * 0.90, height: height * 0.80)
            .background(Color.white)
            .cornerRadius(20)
        }
        .frame(width: width, height: height)
        .background(Color.black.opacity(0.5))
    }
}


struct FilterByListView: View {
    // MARK: Properties
    @State var hideLang: Bool = false
    @State var hideCountry: Bool = false
    @State var hideLocation: Bool = false
    @State var hideMobilityFriendly: Bool = false
    @State var hidePrice: Bool = false
    @State var hideType: Bool = false
    @State var hideCharity: Bool = false
    @State var hideTravelDist: Bool = false
    @State var hideRouteDist: Bool = false
    @State var hideTime: Bool = false
    @State var hideTourGuides: Bool = false
    
    
    @Binding var language: String
    @Binding var country: String
    @Binding var location: String
    @Binding var type: String
    @Binding var charity: String
    @Binding var tourGuides: String
    @Binding var enableMobility: Bool
    @Binding var priceRange: Double
    @Binding var travelDistance: Double
    @Binding var routeDistance: Double
    @Binding var time: Double
    let customBlockHeight: CGFloat = {
        return UIScreen.main.bounds.height * 0.07
    }()
    let customTxtFldHeight: CGFloat = {
        return UIScreen.main.bounds.height * 0.05
    }()
    let customWidth: CGFloat = {
        return UIScreen.main.bounds.width * 0.90
    }()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let borderColor = Color(red: 239/255, green: 239/255, blue: 239/255)
    let bodyColor = Color(red: 239/255, green: 239/255, blue: 239/255)
    let activeColor = Color(red: 30/255, green: 162/255, blue: 207/255)
    var body: some View {
        VStack {
            ScrollView {
                // Group 1
                Group {
                    
                    // Sub Group 1
                    Group {
                        // Language
                        HStack{
                            Text("Language")
                                .bold()
                                .font(.system(size: 17))
                            Spacer()
                            Image(systemName: hideLang ? "chevron.up" : "chevron.down")
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.20)) {
                                        hideLang.toggle()
                                    }
                                }
                        }
                        .frame(height: customBlockHeight)
                        
                        if hideLang {
                            TextField("English", text: $language)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .padding()
                                .frame(height: customTxtFldHeight)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray, lineWidth: 1)
                                )
                        }
                        Divider()
                        
                        // Country
                        HStack{
                            Text("Country")
                                .bold()
                                .font(.system(size: 17))
                            Spacer()
                            Image(systemName: hideCountry ? "chevron.up" : "chevron.down")
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.20)) {
                                        hideCountry.toggle()
                                    }
                                    
                                }
                            
                        }
                        .frame(height: customBlockHeight)
                        
                        if hideCountry {
                            TextField("Search countries", text: $country)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .padding()
                                .frame(height: customTxtFldHeight)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray, lineWidth: 1)
                                )
                        }
                        Divider()
                        
                    }
                    
                    // Sub Group 2
                    Group {
                        // Location
                        HStack{
                            Text("Location")
                                .bold()
                                .font(.system(size: 17))
                            Spacer()
                            Image(systemName: hideLocation ? "chevron.up" : "chevron.down")
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.20)) {
                                        hideLocation.toggle()
                                    }
                                }
                        }
                        .frame(height: customBlockHeight)
                        
                        if hideLocation {
                            TextField("Search location", text: $location)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .padding()
                                .frame(height: customTxtFldHeight)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray, lineWidth: 1)
                                )
                        }
                        Divider()
                        
                        // Mobility Friendly
                        HStack{
                            Text("Mobility Friendly")
                                .bold()
                                .font(.system(size: 17))
                            Spacer()
                            Image(systemName: hideMobilityFriendly ? "chevron.up" : "chevron.down")
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.20)) {
                                        hideMobilityFriendly.toggle()
                                    }
                                }
                        }
                        .frame(height: customBlockHeight)
                        
                        if hideMobilityFriendly {
                            Toggle(isOn: $enableMobility) { }
                                .toggleStyle(CustomToggle())
                                .frame(maxWidth:.infinity, alignment: .leading)
                                .padding(.leading)
                        }
                        Divider()
                    }
                    
                    // Sub Group 3
                    Group {
                        // Price
                        HStack{
                            Text("Price")
                                .bold()
                                .font(.system(size: 17))
                            Spacer()
                            Image(systemName: hidePrice ? "chevron.up" : "chevron.down")
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.20)) {
                                        hidePrice.toggle()
                                    }
                                }
                        }
                        .frame(height: customBlockHeight)
                        
                        if hidePrice {
                            Slider(value: $priceRange, in: 0...100)
                                .tint(activeColor)
                        }
                        Divider()
                        
                        // Type
                        HStack{
                            Text("Type")
                                .bold()
                                .font(.system(size: 17))
                            Spacer()
                            Image(systemName: hideType ? "chevron.up" : "chevron.down")
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.20)) {
                                        hideType.toggle()
                                    }
                                }
                        }
                        .frame(height: customBlockHeight)
                        
                        if hideType {
                            TextField("Type", text: $type)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .padding()
                                .frame(height: customTxtFldHeight)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray, lineWidth: 1)
                                )
                        }
                        Divider()
                    }
                }
                
                // Group 2
                Group {
                    // Sub Group 2-1
                    Group {
                        // Charity
                        HStack{
                            Text("Charity")
                                .bold()
                                .font(.system(size: 17))
                            Spacer()
                            Image(systemName: hideCharity ? "chevron.up" : "chevron.down")
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.20)) {
                                        hideCharity.toggle()
                                    }
                                }
                        }
                        .frame(height: customBlockHeight)
                        
                        if hideCharity {
                            TextField("Charity", text: $charity)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .padding()
                                .frame(height: customTxtFldHeight)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray, lineWidth: 1)
                                )
                        }
                        Divider()
                        
                        // Travel Distance
                        HStack{
                            Text("Travel Distance")
                                .bold()
                                .font(.system(size: 17))
                            Spacer()
                            Image(systemName: hideTravelDist ? "chevron.up" : "chevron.down")
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.20)) {
                                        hideTravelDist.toggle()
                                    }
                                }
                        }
                        .frame(height: customBlockHeight)
                        
                        if hideTravelDist {
                            Slider(value: $travelDistance, in: 0...100)
                                .tint(activeColor)
                        }
                        Divider()
                    }
                    
                    // Sub Group 2-2
                    Group {
                        // Route Distance
                        HStack{
                            Text("Route Distance")
                                .bold()
                                .font(.system(size: 17))
                            Spacer()
                            Image(systemName: hideRouteDist ? "chevron.up" : "chevron.down")
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.20)) {
                                        hideRouteDist.toggle()
                                    }
                                }
                        }
                        .frame(height: customBlockHeight)
                        
                        if hideRouteDist {
                            Slider(value: $routeDistance, in: 0...100)
                                .tint(activeColor)
                        }
                        Divider()
                        
                        // Time
                        HStack{
                            Text("Time")
                                .bold()
                                .font(.system(size: 17))
                            Spacer()
                            Image(systemName: hideTime ? "chevron.up" : "chevron.down")
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.20)) {
                                        hideTime.toggle()
                                    }
                                }
                        }
                        .frame(height: customBlockHeight)
                        
                        if hideTime {
                            Slider(value: $time, in: 0...100)
                                .tint(activeColor)
                        }
                        Divider()
                    }
                    
                    // Sub Group 2-3
                    Group {
                        // Tour Guides
                        HStack{
                            Text("Tour Guides")
                                .bold()
                                .font(.system(size: 17))
                            Spacer()
                            Image(systemName: hideTourGuides ? "chevron.up" : "chevron.down")
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.20)) {
                                        hideTourGuides.toggle()
                                    }
                                }
                        }
                        .frame(height: customBlockHeight)
                        
                        if hideTourGuides {
                            TextField("Tour Guides", text: $tourGuides)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .padding()
                                .frame(height: customTxtFldHeight)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray, lineWidth: 1)
                                )
                        }
                        Divider()
                    }
                }
                
                // Group 3 here
            }
            .scrollIndicators(.hidden)
        }
//        .frame(width: width * 0.90)
    }
}

struct FilterByView_Previews: PreviewProvider {
    static var previews: some View {
        FilterByView(showFilterByView: .constant(true))
    }
}
