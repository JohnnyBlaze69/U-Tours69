//
//  CustomLocation.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 16/01/24.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    static var connaughtPlace: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 28.6304,
            longitude: 77.2177),
        latitudinalMeters: 1000,
        longitudinalMeters: 1000
    )
}
