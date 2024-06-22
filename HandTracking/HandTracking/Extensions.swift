//
//  ModelEntity+Extensions.swift
//  HandTracking
//
//  Created by IVAN CAMPOS on 2/23/24.
//

import SwiftUI
import RealityKit

extension ModelEntity {

    static func createHandEntity() -> ModelEntity {
            let simpleMaterial = SimpleMaterial(color: UIColor(hex: "888888"), isMetallic: false)
            let parentEntity = ModelEntity(mesh: .generateBox(width: 0.5, height: 0.250, depth: 0), materials: [simpleMaterial])
            let childMaterial = SimpleMaterial(color: UIColor(hex: "000000"), isMetallic: false)
            let childEntity = ModelEntity(mesh: .generateBox(width: 0.25, height: 0.125, depth: 0), materials: [childMaterial])
            parentEntity.addChild(childEntity)
            return parentEntity
    }
    
    static func createEnvironmentEntity() -> Entity {
        let bgColor: UIColor = .white
        var material = UnlitMaterial()
        material.color = UnlitMaterial.BaseColor(tint: bgColor)
        
        let environment = Entity()
        environment.components.set(ModelComponent(
            mesh: .generateSphere(radius: 2000),
            materials: [material]
        ))
        
        environment.scale *= .init(x: -2, y: 2, z: 2)
        return environment
        
    }
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(color & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
