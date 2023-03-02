//
//  MapAppApp.swift
//  MapApp
//
//  Created by 김현석 on 2023/03/02.
//

import SwiftUI

@main
struct MapAppApp: App {
    
    // UI를 다시 그릴 때 초기활 될 수 있어서 첫화면에서만 @StateObject 사용
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                // 위 @StateObject 적용하려면 아래 코드 작성.
                .environmentObject(vm)
        }
    }
}
