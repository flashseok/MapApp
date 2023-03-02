//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by 김현석 on 2023/03/02.
//

import Foundation
import SwiftUI
import MapKit

// 관찰 가능오브젝트 만들고
class LocationsViewModel: ObservableObject {
    
    // 변경될때마다 뿌려줌.
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current region on map
    //  여기가 문제
    // [SwiftUI] Publishing changes from within view updates is not allowed, this will cause undefined behavior.
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    
    // Show list of locations
    @Published var showLocationList: Bool = false
    
    init() {
        print(#function)
        let locations = LocationsDataService.locations
        self.locations = locations
        
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
        
    }
    
    private func updateMapRegion(location: Location) {
        print(#function)
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleLocationList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextButtonPressed() {
        
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find current index in locations array. Should never happen.")
            
            return
        }
        
        // Check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is Not valid
            // Restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            
            return
        }
        
        // Next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
                
    }
        
}
