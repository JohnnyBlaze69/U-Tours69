//
//  DestinationCardsView.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 08/01/24.
//

import SwiftUI

struct DestinationCardsView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @StateObject private var destinationViewModel = DestinationCardsViewModel()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(destinationViewModel.popularToursArray) { place in
                    DestinationCard(popularTours: place)
                }
            }
        }
    }
}

struct DestinationCard: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var popularTours: PopularTours?
    var body: some View {
        VStack {
            
            Text(popularTours?.destination ?? "N/A")
                .bold()
                .font(.system(size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)
                
            Text(popularTours?.country ?? "N/A")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 0){
                Image(popularTours?.image ?? "")
                    .resizable()
                    .frame(width: width * 0.45,height: height * 0.15)
                
                VStack(spacing: 0){
                    Text(popularTours?.cardTitle ?? "N/A")
                        .padding(.horizontal, 5)
                        .bold()
                        .font(.system(size: 15))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    
                    HStack{
                        Text("£ \(popularTours?.price ?? 0)")
                            .font(.system(size: 13))
                            .foregroundColor(.green)
                        Spacer()
                        HStack(spacing: 5){
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("5.0")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                            Text("(\(popularTours?.reviewCount ?? 0))")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }    
                    }
                    .padding(.horizontal, 5)
                    
                    HStack {
                        Text("\(popularTours?.locationCount ?? 0) locations")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("\(popularTours?.time ?? 0) mins")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 5)
                    
                }
                .frame(width: width * 0.45, height: height * 0.10)
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.gray, lineWidth: 0.5)
                    .shadow(color: .black.opacity(0.8), radius: 2, x: 2, y: 2)       
            )
        }
    }
}

struct DestinationCardsView_Previews: PreviewProvider {
    static var previews: some View {
        TourKeywordsView()
    }
}


final class DestinationCardsViewModel: ObservableObject {
    @Published var popularToursModel: PopularTours?
    let popularToursArray: [PopularTours] = [
        PopularTours(destination: "Liverpool", country: "United Kingdom", likePercentage: 10, cardTitle: "Livepool Legends: A Cyber", price: 110, reviewCount: 69, locationCount: 18, time: 23, image: "ic_liverpool"),
        PopularTours(destination: "Oxford", country: "United Kingdom", likePercentage: 10, cardTitle: "Oxford: Colorful Place", price: 110, reviewCount: 69, locationCount: 18, time: 23, image: "ic_oxford"),
        PopularTours(destination: "Manchester", country: "United Kingdom", likePercentage: 10, cardTitle: "Manchester United", price: 110, reviewCount: 69, locationCount: 18, time: 23, image: "ic_manchester"),
        PopularTours(destination: "Coventry", country: "United Kingdom", likePercentage: 10, cardTitle: "Coventry Conundrum", price: 110, reviewCount: 69, locationCount: 18, time: 23, image: "ic_coventry"),
        PopularTours(destination: "Bristol", country: "United Kingdom", likePercentage: 10, cardTitle: "Bristol Brussels", price: 110, reviewCount: 69, locationCount: 18, time: 23, image: "ic_bristol")
    ]
}

class PopularTours: NSObject, Identifiable {
    let destination: String?
    let country: String?
    let likePercentage: Int?
    let cardTitle: String?
    let price: Int?
    let reviewCount: Int?
    let locationCount: Int?
    let time: Int?
    let image: String
    
    init(
        destination: String? = nil,
        country: String? = nil,
        likePercentage: Int? = nil,
        cardTitle: String? = nil,
        price: Int? = nil,
        reviewCount: Int? = nil,
        locationCount: Int? = nil,
        time: Int? = nil,
        image: String
    ) {
        self.destination = destination
        self.country = country
        self.likePercentage = likePercentage
        self.cardTitle = cardTitle
        self.price = price
        self.reviewCount = reviewCount
        self.locationCount = locationCount
        self.time = time
        self.image = image
    }
}

struct TourKeywordsView: View {
    @StateObject var tourKeywordsViewModel = TourKeywordsViewModel()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button {
                    
                } label: {
                    Image("ic_cross_fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                
                ForEach(tourKeywordsViewModel.tourkeywordsArr) { keyword in
                    Button {
                        
                    } label: {
                        HStack{
                            Image("\(keyword.keywordIcon ?? "")")
                                .resizable()
//                                .scaledToFit()
                                .frame(width: 15, height: 12)
                            Text("\(keyword.keywordTitle ?? "!")")
                                .font(.system(size: 13))
                                .foregroundColor(.black)
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                        )
                        
                    }
                }
            }
        }
    }
}


final class TourKeywordsViewModel: ObservableObject {
    @Published var tourKeywordsViewModel : TourKeywords?
    
    var tourkeywordsArr: [TourKeywords] = [
        TourKeywords(keywordIcon: "ic_sightseeing", keywordTitle: "Sightseeing"),
        TourKeywords(keywordIcon: "ic_historical", keywordTitle: "Historical"),
        TourKeywords(keywordIcon: "ic_culture", keywordTitle: "Culture"),
        TourKeywords(keywordIcon: "ic_nature", keywordTitle: "Nature"),
        TourKeywords(keywordIcon: "ic_historical", keywordTitle: "Popular"),
        TourKeywords(keywordIcon: "ic_hotspots", keywordTitle: "Newly Selected"),
        TourKeywords(keywordIcon: "ic_culture", keywordTitle: "Hotspots"),
    ]
}

class TourKeywords: Identifiable {
    let id = UUID()
    let keywordIcon: String?
    let keywordTitle: String?
    
    init(keywordIcon: String?=nil, keywordTitle: String?=nil) {
        self.keywordIcon = keywordIcon
        self.keywordTitle = keywordTitle
    }
}
