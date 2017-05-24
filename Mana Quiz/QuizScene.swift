//
//  QuizScene.swift
//  Mana Quiz
//
//  Created by Jovito Royeca on 24/05/2017.
//  Copyright © 2017 Jovito Royeca. All rights reserved.
//

import UIKit
import CoreGraphics
import SpriteKit
import GameplayKit

class QuizScene: BaseScene {
    
    // MARK: Variables
    private var backLabel : SKLabelNode?
    private var blackManaLabel : SKLabelNode?
    private var blueManaLabel : SKLabelNode?
    private var greenManaLabel : SKLabelNode?
    private var redManaLabel : SKLabelNode?
    private var whiteManaLabel : SKLabelNode?
    private var colorlessManaLabel : SKLabelNode?
    private var castingCostLabel : SKLabelNode?
    
    // MARK: Overrides
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        backLabel = childNode(withName: "//backLabel") as? SKLabelNode
        blackManaLabel = childNode(withName: "//blackManaLabel") as? SKLabelNode
        blueManaLabel = childNode(withName: "//blueManaLabel") as? SKLabelNode
        greenManaLabel = childNode(withName: "//greenManaLabel") as? SKLabelNode
        redManaLabel = childNode(withName: "//redManaLabel") as? SKLabelNode
        whiteManaLabel = childNode(withName: "//whiteManaLabel") as? SKLabelNode
        colorlessManaLabel = childNode(withName: "//colorlessManaLabel") as? SKLabelNode
        castingCostLabel = childNode(withName: "//castingCostLabel") as? SKLabelNode
        
        backLabel!.fontName = kClassicFont
        blackManaLabel!.fontName = kClassicFont
        blueManaLabel!.fontName = kClassicFont
        greenManaLabel!.fontName = kClassicFont
        redManaLabel!.fontName = kClassicFont
        whiteManaLabel!.fontName = kClassicFont
        colorlessManaLabel!.fontName = kClassicFont
        castingCostLabel!.fontName = kClassicFont
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = atPoint(pos)
            
            if node == backLabel {
                goBack()
            }
        }
    }

}
