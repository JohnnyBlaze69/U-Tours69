//
//  MyToursModel.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 16/01/24.
//

import Foundation


class PlacesToGo: Identifiable {
     let destination, countryOfOrigin, eta, costOfTour: String?
     let destImages: [String]?
     let hotspot: [Hotspots]?
     let guides: [Guides]?
     let expectedTourTime: String?
     let nearbyLocName: [NearbyLocation]?
     let keywords: [String]?
    
    init(
        destination: String? = nil,
        countryOfOrigin: String? = nil,
        destImages: [String]? = nil,
        eta: String? = nil,
        hotspot: [Hotspots]? = nil,
        guides: [Guides]? = nil,
        expectedTourTime: String? = nil,
        nearbyLocName: [NearbyLocation]? = nil,
        keywords: [String]? = nil,
        costOfTour: String? = nil
    ) {
        self.destination = destination
        self.countryOfOrigin = countryOfOrigin
        self.eta = eta
        self.destImages = destImages
        self.hotspot = hotspot
        self.guides = guides
        self.expectedTourTime = expectedTourTime
        self.nearbyLocName = nearbyLocName
        self.keywords = keywords
        self.costOfTour = costOfTour
    }
}

class Hotspots {
    let venueTitle, venueDescription, rating, reviewCount: String?

    init(
        venueTitle: String? = nil,
        venueDescription: String? = nil,
        rating: String? = nil,
        reviewCount: String? = nil
    ) {
        self.venueTitle = venueTitle
        self.venueDescription = venueDescription
        self.rating = rating
        self.reviewCount = reviewCount
    }
}

class Guides {
    let guideName: String?
    let guidePhoto: String?
    
    init(
        guideName: String? = nil,
        guidePhoto: String? = nil
    ) {
        self.guideName = guideName
        self.guidePhoto = guidePhoto
    }

}

class NearbyLocation: Identifiable {
    let id = UUID()
    let locName: String?
    
    init(
        locName: String? = nil
    ) {
        self.locName = locName
    }
}
