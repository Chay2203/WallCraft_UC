//
//  ContentView.swift
//  Doodle
//
//  Created by Pradyut Fogla on 26/02/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
       PanelSelectionView()
    }
}

#Preview {
    ContentView()
        .environment(ViewModel())
}
