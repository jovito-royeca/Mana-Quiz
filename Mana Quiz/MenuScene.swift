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

class MenuScene: BaseScene {
    
    // MARK: Variables
    private var titleLabel : SKLabelNode?
    private var playLabel : SKLabelNode?
    private var accountLabel : SKLabelNode?
    private var leaderboardLabel : SKLabelNode?
    
    // MARK: Overrides
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        titleLabel = childNode(withName: "//titleLabel") as? SKLabelNode
        playLabel = childNode(withName: "//playLabel") as? SKLabelNode
        accountLabel = childNode(withName: "//accountLabel") as? SKLabelNode
        leaderboardLabel = childNode(withName: "//leaderboardLabel") as? SKLabelNode
        
        titleLabel!.fontName = kClassicFont
        playLabel!.fontName = kClassicFont
        accountLabel!.fontName = kClassicFont
        leaderboardLabel!.fontName = kClassicFont
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = atPoint(pos)
            
            if node == playLabel {
                if let view = view {
                    let scene = QuizScene(fileNamed: "QuizScene")
                    scene!.scaleMode = .aspectFill
                    scene!.previousScene = self
                    view.presentScene(scene)
                }
            }
        }
    }
    
}
