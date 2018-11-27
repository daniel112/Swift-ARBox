//
//  Extensions.swift
//  ARPortal
//
//  Created by Daniel Yo on 11/27/18.
//  Copyright © 2018 Daniel Yo. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

var width : CGFloat = 0.1
var height : CGFloat = 10
var length : CGFloat = 10
var doorLength : CGFloat = 0.3

func createBox(isDoor : Bool) -> SCNNode {
    let node = SCNNode()
    
    // add first box - outer box
    let firstBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    let firstBoxNode = SCNNode(geometry: firstBox)
    firstBoxNode.renderingOrder = 200
        let material = SCNMaterial()
        material.diffuse.contents = UIImage.init(named: "bg")//UIColor.green
        firstBox.materials = [material]
    node.addChildNode(firstBoxNode)
    
    
    // add masked box - inner box
    let maskedBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    maskedBox.firstMaterial?.diffuse.contents = UIColor.yellow
    maskedBox.firstMaterial?.transparency = 0.00001
    
    let maskedBoxNode = SCNNode(geometry: maskedBox)
    maskedBoxNode.renderingOrder = 100
    maskedBoxNode.position = SCNVector3.init(width, 0, 0) // place this box next to the other one
    node.addChildNode(maskedBoxNode)
    
    return node
}

extension FloatingPoint {
    var degreesToRadians : Self {
        return self * .pi / 180
    }
    
    var radiansToDegrees : Self {
        return self * 180 / .pi
    }
}
