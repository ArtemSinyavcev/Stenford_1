//
//  ViewController.swift
//  Stenford_1
//
//  Created by Артём Синявцев on 30.11.2022.
//

import UIKit

class ViewController: UIViewController {

    // Создание экземпляра класса
   lazy var game = ConcentrationGame(colichestvoParnihCard: (knopkaCollection.count + 1) / 2)
    
  
    var nazatie = 0 {
        didSet{
            colichestvoNazatii.text = ("Кол - во: \(nazatie)")
        }
    }
    
    
    
    var collectionImoji = ["🐍","🪱","🪰","🦀","🦅","🐙","🐢","🐭","🦞","🐤","🦉","🐘"]
    
    var emojiDictionary = [Int:String]()
    
    func emojiIdentefaer (for card:Card) -> String {
        if emojiDictionary[card.identificator] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(collectionImoji.count)))
            emojiDictionary[card.identificator] = collectionImoji.remove(at: randomIndex)
        }
        return emojiDictionary[card.identificator] ?? "?"
    }
    
    func obnovlenieVida() {
        
        for index in knopkaCollection.indices {
            let knopka = knopkaCollection[index]
            let card = game.cards[index]
            if card.kartaPerevernytaya {
                knopka.setTitle(emojiIdentefaer(for: card), for: .normal)
                knopka.backgroundColor = .white
            } else {
                knopka.setTitle("", for: .normal)
                knopka.backgroundColor = card.kartaSovpala ? .yellow : .red
            }
        }
    }
    
    @IBOutlet var knopkaCollection: [UIButton]!
    @IBOutlet weak var colichestvoNazatii: UILabel!
    @IBAction func knopkaAction(_ sender: UIButton) {
        nazatie += 1
        
        if let knopkaIndex = knopkaCollection.firstIndex(of: sender){
            game.vibranayaCard(at: knopkaIndex)
            obnovlenieVida()
        }
        
    }
    
}

