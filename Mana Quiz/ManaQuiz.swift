//
//  ManaQuiz.swift
//  Mana Quiz
//
//  Created by Jovito Royeca on 24/05/2017.
//  Copyright © 2017 Jovito Royeca. All rights reserved.
//

import UIKit
import DATAStack
import Sync

class ManaQuiz: NSObject {
    // MARK: - Shared Instance
    open static let sharedInstance = ManaQuiz()
    
    // MARK: Variables
    fileprivate var _dataStack:DATAStack?
    open var dataStack:DATAStack? {
        get {
            if _dataStack == nil {
                let bundle = Bundle(for: ManaQuiz.self)
                guard let momURL = bundle.url(forResource: "Card Magus", withExtension: "momd") else { return nil }
                guard let objectModel = NSManagedObjectModel(contentsOf: momURL) else { return nil }
                _dataStack = DATAStack(model: objectModel, storeType: .sqLite)
            }
            return _dataStack
        }
    }
    
    // MARK: Custom methods
    func randomCard() -> CMCard {
        // TODO: do not fetch Gleemax
        
        let request:NSFetchRequest<CMCard> = CMCard.fetchRequest() as! NSFetchRequest<CMCard>
        // TO DO: exclude lands
        request.predicate = NSPredicate(format: "name != %@", "Gleemax")
        
        let cards = try! dataStack?.mainContext.fetch(request)
        let random = Int(arc4random()) % (cards!.count - 1) + 1
        return cards![random]
    }
}
