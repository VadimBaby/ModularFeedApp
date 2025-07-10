//
//  File.swift
//  MyCommon
//
//  Created by Вадим Мартыненко on 08.06.2025.
//

public extension String {
    var isNotEmpty: Bool {
        !isEmpty
    }
    
    static var empty: String {
        ""
    }
    
    static var rubleSign: String {
        "₽"
    }
    
    static var space: String {
        " "
    }
    
    static var plusSign: String {
        "+"
    }
    
    static var minusSign: String {
        "-"
    }
    
    enum LocationSign {
        case start, end
    }
    
    func appendRubleSign(withSpacer isSpacer: Bool = false, locationSign: LocationSign = .end) -> String {
        let spacer: String = isSpacer ? .space : .empty
        
        switch locationSign {
        case .end: return self + spacer + .rubleSign
        case .start: return .rubleSign + spacer + self
        }
    }
}
