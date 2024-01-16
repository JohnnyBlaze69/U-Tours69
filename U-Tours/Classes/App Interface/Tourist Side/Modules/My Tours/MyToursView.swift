//
//  MyToursView.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 11/01/24.
//

import SwiftUI
import AVKit
import MapKit


struct MyToursView: View {
    @StateObject var placesToGoViewModel = PlacesToGoViewModel()
    var body: some View {
        ForEach(placesToGoViewModel.placesToGoArray) { place in
            MyToursContent(placesToGo: place)
        }
    }
}


struct MyToursContent: View {
    var placesToGo: PlacesToGo?
    var body: some View {
        VStack(spacing: 0){
            TopBanner(placesToGo: placesToGo)
            ScrollView(showsIndicators: false) {
                HotspotsView(placesToGo: placesToGo)
                Divider()
                GuidesView(placesToGo: placesToGo)
                ToursMapView()
                NearbyLocationsView(placesToGo: placesToGo)
                KeywordsView(placesToGo: placesToGo)
            }
            Divider()
            PurchasePriceView(placesToGo: placesToGo)
            Divider()
        }
    }
}

struct TopBanner: View {
    var placesToGo: PlacesToGo?
    let iconWidth: CGFloat = { return 30 }()
    let iconHeight: CGFloat = { return 30 }()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack{
            // Banner View
            VStack{
                Image(placesToGo?.destImages?[0] ?? "~")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            .frame(
                width: Size.shared.screenWidth(),
                height: Size.shared.screenHeight() * 0.22
            )
            
            // Detail Overlay
            ZStack(alignment: .top){
                VStack(alignment: .leading){
                    HStack{
                        Image("ic_chevron_left")
                            .resizable()
                            .frame(width: iconWidth, height: iconHeight)
                        Spacer()
                        Image("ic_share")
                            .resizable()
                            .frame(width: iconWidth, height: iconHeight)
                        Image("ic_like")
                            .resizable()
                            .frame(width: iconWidth, height: iconHeight)
                    }
                    
                    Spacer().frame(height: height * 0.025)
                    
                    Text(placesToGo?.destination ?? "~")
                        .bold()
                        .font(.system(size: 25))
                        .foregroundColor(Color.white)
                        .padding(.top)
                    
                    Text("(\(placesToGo?.countryOfOrigin ?? "~"))")
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .underline()

                }
                .frame(width: width * 0.80)
            }
        }
    }
}

struct HotspotsView: View {
    @State private var readMore: Bool = false
    var placesToGo: PlacesToGo?
    let iconWidth: CGFloat = { return 30 }()
    let iconHeight: CGFloat = { return 30 }()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var viewWidthMargin: CGFloat = {return UIScreen.main.bounds.width * 0.80}()
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text(placesToGo?.hotspot?[0].venueTitle ?? "!")
                .lineSpacing(5)
                .bold()
                .font(.system(size: 24))
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(placesToGo?.hotspot?[0].venueDescription ?? "!")
                .lineLimit(readMore ? nil: 1)
                .lineSpacing(5)
                .font(.system(size: 17))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
 
            Button {
                withAnimation(.linear(duration: 0.20)) {
                    readMore.toggle()
                }
            } label: {
                Text(readMore ? "Read Less": "Read More")
                    .foregroundColor(.black)
                    .font(.system(size: 10))
                    .underline()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .buttonStyle(.borderless)
            
            
            HStack{
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.yellow)
                Text(placesToGo?.hotspot?[0].rating ?? "!")
                    .foregroundColor(.yellow)
                    .font(.system(size: 15))
                Text("(\(placesToGo?.hotspot?[0].reviewCount ?? "!") reviews)")
                    .foregroundColor(Color(.systemGray4))
                    .font(.system(size: 15))
                    .underline()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical)
        .frame(width: viewWidthMargin)
    }
}

struct GuidesView: View {
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "guideVids", withExtension: "mp4")!)
    var placesToGo: PlacesToGo?
    let iconWidth: CGFloat = { return 30 }()
    let iconHeight: CGFloat = { return 30 }()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var viewWidthMargin: CGFloat = {return UIScreen.main.bounds.width * 0.80}()
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    Group {
                        Text("Guided by ")
                            .bold()
                             +
                        Text(placesToGo?.guides?[0].guideName ?? "!")
                            
                    }
                    .padding(.vertical)
                    .font(.system(size: 20))
                    
                    Button{
                        // profile here
                    } label: {
                        Text("Profile")
                            .foregroundColor(.blue)
                            .font(.system(size: 15))
                    }
                }
                
                Spacer()

                Image(placesToGo?.guides?[0].guidePhoto ?? "!")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.black, lineWidth: 1)
                    )
                
            }
            .padding(.vertical)

            
            // insert av player
            VideoPlayer(player: player)
                .frame(height: height * 0.20)
                .cornerRadius(10)
            
            HStack{
                Group {
                    Text("Expected Tour Time - ")
                        .bold()
                        .font(.system(size: 17))
                    +
                    Text(placesToGo?.expectedTourTime ?? "!")
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.blue)
                        .frame(width: iconWidth, height: iconHeight)
                }
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .leading)
//            .border(.red, width: 2)
            
            
        }
        .frame(width: viewWidthMargin)
    }
}

struct ToursMapView: View {
    var body: some View {
        Map(coordinateRegion: .constant(.connaughtPlace))
            .frame(height: Size.shared.screenHeight() * 0.25)
    }
}

struct NearbyLocationsView: View {
    var placesToGo: PlacesToGo?
    var viewWidthMargin: CGFloat = {return UIScreen.main.bounds.width * 0.80}()
    var body: some View {
        VStack {
            Group {
                Text("List of Locations")
                    .font(.system(size: 19))
                    .bold()
                    .padding(.top)

                ForEach(placesToGo?.nearbyLocName ?? []) { loc in
                    Text(loc.locName ?? "!")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                        .padding(.vertical, 5)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

        }
        .frame(width: viewWidthMargin)

    }
}

struct KeywordsView: View {
    var placesToGo: PlacesToGo?
    var viewWidthMargin: CGFloat = {return UIScreen.main.bounds.width * 0.80}()
    var body: some View {
        WrappingHStack(horizontalSpacing: 5) {
            ForEach(placesToGo?.keywords ?? [], id: \.self) { keyword in
                Text(keyword)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .font(.system(size: 15))
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 30))

            }
            
        }
        .frame(width: viewWidthMargin)
        .padding(.vertical)
        
    }
}

struct PurchasePriceView: View {
    var placesToGo: PlacesToGo?
    var viewWidthMargin: CGFloat = { return UIScreen.main.bounds.width * 0.80 }()
    let activeColor = Color(red: 30/255, green: 162/255, blue: 207/255)
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Group {
                    Text("Total : ")
                        .bold()
                        .font(.system(size: 18))
                    +
                    Text("£\(placesToGo?.costOfTour ?? "")")
                        .bold()
                        .foregroundColor(.green)
                }
                
                Text(placesToGo?.eta ?? "")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            Spacer()
            Button {
                print("Debug: Purchase Btn tap")
            } label: {
                Text("Purchase")
                    .font(.system(size: 17))
                    .bold()
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(activeColor)
            }
            .cornerRadius(10)
            .frame(width: Size.shared.screenWidth() * 0.40)
            
        }
        .frame(width: viewWidthMargin)
        .padding(.vertical, 9)
        
    }
}

struct MyToursView_Previews: PreviewProvider {
    static var previews: some View {
        MyToursView()
    }
}

