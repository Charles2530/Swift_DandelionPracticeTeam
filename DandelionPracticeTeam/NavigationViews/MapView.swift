//
//  MapView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/11/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.3571, longitude: 111.5812), // 中阳县的大致坐标
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5) // 调整这些值可以控制地图的缩放级别
    )

    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region)
                .navigationTitle("中阳县地图")
                .navigationBarTitleDisplayMode(.inline)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
