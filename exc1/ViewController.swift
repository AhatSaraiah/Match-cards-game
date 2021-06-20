    //
    //  ViewController.swift
    //  exc1
    //
    //  Created by user196211.
    //

    import UIKit

    class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{

        @IBOutlet weak var collectionView: UICollectionView!
        
        @IBOutlet weak var movesLabel: UILabel!
         var moves=0
        let model = CardModel()
        var cardArr = [Card]()
        
        var firstFlippedCardIndex:IndexPath?
        
        let columnLayout = ColumnFlowLayout(
            cellsPerRow: 4,
            minimumInteritemSpacing: 20,
            minimumLineSpacing: 20,
            sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        )
    
        override func viewDidLoad() {
                super.viewDidLoad()
                cardArr = model.getCards()
                    
                collectionView.delegate = self
                collectionView.dataSource = self
            collectionView?.collectionViewLayout = columnLayout

        }

        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                  
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
                        movesLabel.text = "Moves : \(moves) "
                        //perform the matching Logic
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
        
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        
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
            
       
        }
        else{
            //It's not a match
            
            //flip back the cards
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
            

        }
        
        // reload the cell of the first card if it is nil
        if cardOneCell == nil {
            collectionView.reloadItems(at: [firstFlippedCardIndex!])
            cardOne.isFlipped = false
        }
        
        //reset the indexpath to nil
        firstFlippedCardIndex = nil
        
    }

       
    }
        
       
