//
//  LocationView.swift
//  MapApp
//
//  Created by 김현석 on 2023/03/02.
//

import SwiftUI

struct LocationView: View {
    
    // 뷰모델에서 값을 바로 가져온다.(데이터 변경되면 자동으로 업뎃)
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) {
                Text($0.name)
            }
        }
    }
}





struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationsViewModel())
    }
}
