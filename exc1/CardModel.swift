//
//  CardModel.swift
//  exc1
//
//  Created by user196211.
//

import Foundation
class CardModel {
    
    func getCards() -> [Card] {
        var generatedCards = [Card]()
    
        for _ in 1...8 {
            //genarate a number
            let randomNum = arc4random_uniform(8) + 1
             //create first card
            let card1 = Card()
            print(randomNum)
                
                
            card1.imageName = "card\(randomNum)"
                
                
            generatedCards.append(card1)
            
            //create second card
            let card2 = Card()

            card2.imageName = "card\(randomNum)"
            generatedCards.append(card2)

        }
        generatedCards.shuffle()
        return generatedCards
 }
}
