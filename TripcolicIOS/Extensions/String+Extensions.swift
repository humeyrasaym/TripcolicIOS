//
//  String+Extensions.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 5/17/23.
//

import Foundation

extension String {
    
    var formatPhoneForCall: String{
        
        self.replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "+", with: "")
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: "-", with: "")
            
    }
}
