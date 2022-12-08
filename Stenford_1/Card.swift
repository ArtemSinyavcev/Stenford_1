//
//  Card.swift
//  Stenford_1
//
//  Created by Артём Синявцев on 02.12.2022.
// 666
// 77777777
import Foundation

struct Card {
    
    var kartaPerevernytaya = false
    var kartaSovpala = false
    var identificator: Int
    
    
    static var identificatorNomer = 0
    
    static func identificatorGenerator() -> Int{
        identificatorNomer += 1
        return identificatorNomer
        
    }
    
    init(){
        self.identificator = Card.identificatorGenerator()
    }
    
}
