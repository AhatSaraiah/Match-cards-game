//
//  CardCollectionViewCell.swift
//  exc1
//
//  Created by user196211 .
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backImg: UIImageView!
    
    @IBOutlet weak var frontImg: UIImageView!
    var card:Card?
    
    func configuredCell(card:Card){
        self.card=card
        frontImg.image = UIImage(named: card.imageName)
    
  
        //Check if card is in flipped state or not
        if card.isFlipped
              {
                  //filp the card
                flipUp(speed: 0)
              }
              else
              {
                  //Flipback the card
                flipBack(speed:0)
              }
    }
    
    func flipUp(speed: TimeInterval=0.3){
        UIView.transition(from: backImg, to: frontImg, duration:speed, options: [.showHideTransitionViews,.transitionFlipFromLeft],completion: nil)
        card?.isFlipped = true
        }
    
    func flipBack(speed: TimeInterval=0.3){
        
    
    //Delay the flipback
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
        UIView.transition(from: self.frontImg, to: self.backImg, duration: speed, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
    }
    
    //set the status of the card
    card?.isFlipped = false
    }
    func remove() {
        //make the card invisible
        backImg.alpha = 0
        
        //Animate it
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseInOut, animations: {
            
            self.frontImg.alpha = 0
            
        }, completion: nil)
        
    }
}

