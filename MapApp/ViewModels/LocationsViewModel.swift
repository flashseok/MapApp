//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by 김현석 on 2023/03/02.
//

import Foundation

// 관찰 가능오브젝트 만들고
class LocationsViewModel: ObservableObject {
    
    // 변경될때마다 뿌려줌.
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
        
}
