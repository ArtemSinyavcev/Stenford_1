//
//  ConcentrationGame.swift
//  Stenford_1
//
//  Created by Артём Синявцев on 02.12.2022.
//

import Foundation

class ConcentrationGame {
    
    var cards = [Card]()
    
    var odnaPerevernutayaCard: Int?
    
    // Функция для понимания, как будет играться игра
    func vibranayaCard(at index: Int){
        if !cards[index].kartaSovpala {
            if let sootvetstvieIndexa = odnaPerevernutayaCard, sootvetstvieIndexa != index{
                if cards[sootvetstvieIndexa].identificator == cards[index].identificator {
                    cards[sootvetstvieIndexa].kartaSovpala = true
                    cards[index].kartaSovpala = true
                    
                }
                cards[index].kartaPerevernytaya = true
                odnaPerevernutayaCard = nil
            } else {
                for perevernutVniz in cards.indices {
                    cards [perevernutVniz].kartaSovpala = false
                }
                cards[index].kartaPerevernytaya = true
                odnaPerevernutayaCard = index
            }
        }
        
    }
    
    init(colichestvoParnihCard: Int) {
        
        for _ in 1...colichestvoParnihCard{
            let card = Card()
            cards.append(card)
            cards.append(card)
            // cards += [card, card]
        }
    }
}
