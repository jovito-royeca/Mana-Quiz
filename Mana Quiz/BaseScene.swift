//
//  BaseScene.swift
//  Mana Quiz
//
//  Created by Jovito Royeca on 24/05/2017.
//  Copyright © 2017 Jovito Royeca. All rights reserved.
//

import UIKit
import CoreGraphics
import SpriteKit
import GameplayKit

class BaseScene: SKScene {
    
    // MARK: Variables
    let kClassicFont              = "Magic:the Gathering"
    let kEightEditionFont         = "Matrix-Bold"
    let kLatestFont               = "Beleren"
    var previousScene:SKScene?
    
    // MARK: Overrides
    override func sceneDidLoad() {
        setupBackground()
    }
    
    // MARK: Custom methods
    func setupBackground() {
        let backgroundImage = UIImage(named: "background")
        let backgroundRect = CGRect(origin: CGPoint.zero, size: backgroundImage!.size)
        
        UIGraphicsBeginImageContext(size)
        var context = UIGraphicsGetCurrentContext();
        context!.draw(backgroundImage!.cgImage!, in: backgroundRect, byTiling: true)
        let tiledBackground = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let backgroundTexture = SKTexture(cgImage: tiledBackground!.cgImage!)
        let backgroundTiles = SKSpriteNode(texture: backgroundTexture)
        backgroundTiles.yScale = -1; //upon closer inspection, I noticed my source tile was flipped vertically, so this just flipped it back.
        backgroundTiles.position = CGPoint(x: 0, y: 0)
        backgroundTiles.zPosition = -2
        addChild(backgroundTiles)
        
        
        let circleImage = UIImage(named: "circle")
        let circleSize = CGSize(width: size.width, height: size.width)
        let circleRect = CGRect(origin: CGPoint.zero, size: circleSize)
        
        UIGraphicsBeginImageContext(circleSize)
        context = UIGraphicsGetCurrentContext();
        context!.draw(circleImage!.cgImage!, in: circleRect)
        let circleBackground = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let circleTexture = SKTexture(cgImage: circleBackground!.cgImage!)
        let circleNode = SKSpriteNode(texture: circleTexture)
        circleNode.position = CGPoint(x: 0, y: (size.height - size.width) / 2)
        circleNode.zPosition = -1
        addChild(circleNode)
    }
    
    func goBack() {
        if let previousScene = previousScene,
            let view = view {
            view.presentScene(previousScene)
        }
    }
}
