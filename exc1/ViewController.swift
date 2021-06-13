//
//  ViewController.swift
//  exc1
//
//  Created by user196211 on 5/27/21.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var movesLabel: UILabel!
     var moves=0
    //  @IBOutlet weak var timerLabel: UILabel!
    let model = CardModel()
    var cardArr = [Card]()
    
    var firstFlippedCardIndex:IndexPath?
    
 //   var timer:Timer?
   // var millisecond:Float = 30 * 1000 //10 seconds
    
    override func viewDidLoad() {
            super.viewDidLoad()
            cardArr = model.getCards()
                
            collectionView.delegate = self
            collectionView.dataSource = self
    
    //create timer
        //timerLabel.textColor = UIColor.black
     //   timer = Timer.scheduledTimer(timeInterval: 0.001, target: self,selector: "timerLeft", userInfo: nil, repeats: true)
     //   RunLoop.main.add(timer!, forMode: .common)

    }
    // MARK:- Timer Methods
       
      // @objc func timerLeft() {
//
       //    millisecond -= 1
//
//           //convert to seconds
         ///  let seconds = String(format: "%.2f", millisecond/1000)
//
//           //set the label
//           timerLabel.text = "Time Remaining : \(seconds) "
//
//           //when timer has reached 0
      //    if millisecond <= 0
      //     {
//               //stop the timer
           //   timer?.invalidate()
//
//               timerLabel.textColor = UIColor.red
//
//               //check if there are any cards unmatched
        //         checkGameEnded()
        //   }
     // }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)as? CardCollectionViewCell
//        cell?.flipUp()
        
              //Check if there is any time left(so that the UI avtions can be stopped after 0 seconds)
         //     if millisecond <= 0 {
       ///           return
           //   }
              
              //get the selected card
              let card = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
              
              //check if the card is flipped
              if !card.card!.isFlipped && !card.card!.isMatched
              {
                  
                  //filp the card
                card.flipUp()
                  
                  //check if the card flipped is first
                  if firstFlippedCardIndex == nil
                  {
                      
                      //This is the first card beiing flipped
                      firstFlippedCardIndex = indexPath
                  }
                  else
                  {
                      //This is the second card being flipped
                       moves+=1
                    movesLabel.text = "Moves : \(moves) "                      //perform the matching Logic
                      checkForMatches(indexPath)
                  }
              }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCollectionViewCell
        let card = cardArr[indexPath.row]
        cell.configuredCell(card: card)
        return cell

    }

    


    

func checkForMatches(_ secondFlippedCardIndex:IndexPath) {
    
    //get the cells for two cards that were revealed
    let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
    
    let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
    
    //Get the Cards for two cards that were revealed
    let cardOne = cardArr[firstFlippedCardIndex!.row]
    let cardTwo = cardArr[secondFlippedCardIndex.row]
    
    
    if cardOne.imageName == cardTwo.imageName
    {
        //It's a match
        
        //Set the status of the cards
        cardOne.isMatched = true
        cardTwo.isMatched = true

            
            //remove the matched pairs
            cardOneCell?.remove()
            cardTwoCell?.remove()
        
        //Check if there are any cards left unmatched
        checkGameEnded()
    }
    else{
        //It's not a match
        
        //flip back the cards
        cardOneCell?.flipBack()
        cardTwoCell?.flipBack()
        

    }
    
    //tell the collectionView to reload the cell of the first card if it is nil
    if cardOneCell == nil {
        collectionView.reloadItems(at: [firstFlippedCardIndex!])
        cardOne.isFlipped = false
    }
    
    //reset the indexpath to nil
    firstFlippedCardIndex = nil
    
}
func checkGameEnded()
   {
       //Check if there are any cards unmatched
       var isWon = true
       
       for card in cardArr {
           
           if !card.isMatched {
               
               isWon = false
               break
               
           }
       }
       //Alert variable
      // var title = ""
      // var message = ""
       
    //   If not, then user won
 //      if isWon {
           
       //    if millisecond > 0 {
               
        //       timer?.invalidate()
               
        //   }
           
        //   title = "Conguralations"
       //    message = "You Won"
           
   //   }
    //   else {
         //  If there are unmatched cards, check if there is any time left
     //      if millisecond > 0 {
     //          return
       //    }
           
      //     title = "Game Over"
        //   message = "You Lost"
    //  }
       
       //Show user won/lost alert
   //    showAlert(title, message)
       
   }
}
        
       
