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
    var backLabel: SKLabelNode?
    var blackManaLabel: SKLabelNode?
    var blueManaLabel: SKLabelNode?
    var greenManaLabel: SKLabelNode?
    var redManaLabel: SKLabelNode?
    var whiteManaLabel: SKLabelNode?
    var colorlessManaLabel: SKLabelNode?
    var castingCostLabel: SKLabelNode?
    var cropImage: SKSpriteNode?
    var castingCostNodes:[SKSpriteNode]?
    
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
        cropImage = childNode(withName: "//cropImage") as? SKSpriteNode
        
        backLabel!.fontName = kClassicFont
        blackManaLabel!.fontName = kClassicFont
        blueManaLabel!.fontName = kClassicFont
        greenManaLabel!.fontName = kClassicFont
        redManaLabel!.fontName = kClassicFont
        whiteManaLabel!.fontName = kClassicFont
        colorlessManaLabel!.fontName = kClassicFont
        castingCostLabel!.fontName = kClassicFont
        
        loadCard()
    }
    
    func loadCard() {
        let card = ManaQuiz.sharedInstance.randomCard()
        castingCostNodes = [SKSpriteNode]()
        
        // casting cost
        if let manaCost = card.manaCost {
            let mc = manaCost.replacingOccurrences(of: "{", with: "")
                .replacingOccurrences(of: "}", with: " ")
                .replacingOccurrences(of: "/", with: "")
            let manaArray = mc.components(separatedBy: " ")
            
            var x = castingCostLabel!.frame.origin.x + castingCostLabel!.frame.size.width + 30
            let y = castingCostLabel!.frame.origin.y + 20
            var width = CGFloat(30)
            let height = CGFloat(30)
            
            for mana in manaArray {
                if mana.characters.count == 0 {
                    continue
                }
                
                if mana == "1000000" {
                    width *= 3
                }
                
                var image = UIImage(named: mana)
                
                // fix for dual manas
                if image == nil {
                    if mana.characters.count > 1 {
                        let reversedMana = String(mana.characters.reversed())
                        image = UIImage(named: reversedMana)
                    }
                }
                
                let texture = SKTexture(cgImage: image!.cgImage!)
                let node = SKSpriteNode(texture: texture)
                node.position = CGPoint(x: x, y: y)
                node.size = CGSize(width: width, height: height)
                castingCostNodes!.append(node)
                addChild(node)
                
                x += width
            }
        }
        
        // cropped image
        CardMagus.sharedInstance.downloadCardImage(card, cropImage: true, completion: { (c: CMCard, image: UIImage?, croppedImage: UIImage?, error: NSError?) in
            if error == nil {
                self.cropImage!.texture = SKTexture(cgImage: croppedImage!.cgImage!)
            }
        })
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
