//
//  MenuScene.swift
//  Mana Quiz
//
//  Created by Jovito Royeca on 24/05/2017.
//  Copyright © 2017 Jovito Royeca. All rights reserved.
//

import UIKit
import CoreGraphics
import SpriteKit
import GameplayKit

class MenuScene: SKScene {

    override func sceneDidLoad() {
        let texture = UIImage(named: "background")
        let textureSize = CGRect(origin: CGPoint.zero, size: texture!.size)
        
        UIGraphicsBeginImageContext(self.size)
        let context = UIGraphicsGetCurrentContext();
        context?.draw(texture!.cgImage!, in: textureSize, byTiling: true)
        let tiledBackground = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let backgroundTexture = SKTexture(cgImage: tiledBackground!.cgImage!)
        let backgroundTiles = SKSpriteNode(texture: backgroundTexture)
        backgroundTiles.yScale = -1; //upon closer inspection, I noticed my source tile was flipped vertically, so this just flipped it back.
        backgroundTiles.position = CGPoint(x: 0, y: 0)
        backgroundTiles.zPosition = -1
        addChild(backgroundTiles)
    }
    
}
