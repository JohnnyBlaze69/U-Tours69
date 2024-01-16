//
//  MyToursViewModel.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 16/01/24.
//

import Foundation


final class PlacesToGoViewModel: ObservableObject {
    @Published var placesToGo: PlacesToGo?
    
    var placesToGoArray: [PlacesToGo] = [
        PlacesToGo(
            destination: "Prague",
            countryOfOrigin: "Czech Republic",
            destImages: ["prague1", "prague2", "prague3", "prague4", "prague5", "prague6"],
            eta: "1 hr 21 mins",
            hotspot: [
                Hotspots(
                venueTitle: "The Best Beer Gardens in Prague",
                venueDescription: "If you like beer, you will enjoy this tour because they have got ample beer. Enough to get everyone full up to the brim. You may not be able to walk home though. Therefore it is advisable to get a taxi. If you cannot afford one, one will be provided for you by the state. You also have the right to remain silent as anything you say can and will be used against you in the court of law. Shawty got low low low low low. She had them apple bottom jeans, boots with the fur, the whole club was looking at her. She hit the floor, first thing you know, shawty got low low low low low low.",
                rating: "4.5",
                reviewCount: "29"),
                Hotspots(
                venueTitle: "Hanging Gardens Of Greece",
                venueDescription: "The best hanging gardens in the world to witness the beauty of hanging gardens",
                rating: "4.7",
                reviewCount: "62"),
                Hotspots(
                venueTitle: "Blue Water Lagoon Of Lagos",
                venueDescription: "Water so blue puts even the sky to shame",
                rating: "5",
                reviewCount: "12")
            ],
            guides: [
                Guides(guideName: "Jessica Chambete", guidePhoto: "guide4"),
                Guides(guideName: "Andrea Bosteisn", guidePhoto: "guide5"),
                Guides(guideName: "Emily Jwunds", guidePhoto: "guide6"),
            ],
            expectedTourTime: "2 hrs",
            nearbyLocName: [
                NearbyLocation(locName: "Letnå Lookout Beer Garden"),
                NearbyLocation(locName: "Zahradni restaurace Letensky zamecek"),
                NearbyLocation(locName: "Lod Pivovar"),
                NearbyLocation(locName: "Parnik-plavba po Vltave"),
                NearbyLocation(locName: "Hanau pavilion"),
                NearbyLocation(locName: "Lokak Dlouhaaa")
            ],
            keywords: [
                "Nature", "Sightseeing", "Summer", "Culture", "Historical"
            ],
            costOfTour: "19.99"
        )
    ]
    
    
}
