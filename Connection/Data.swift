//
//  Data.swift
//  Connection
//
//  Created by Wesley Cope on 2/2/16.
//  Copyright © 2016 Pilot Foundation. All rights reserved.
//

import Foundation
import Darwin

class Data {
    let bytes:UnsafeMutablePointer<Int8>
    let capacity:Int
    
    var characters:[CChar] {
        var data = [CChar](count: capacity, repeatedValue: 0)
        memcpy(&data, bytes, data.count)
        
        return data
    }
    
    var string:String? {
        return String.fromCString(characters)
    }
    
    init(capacity:Int) {
        bytes           = UnsafeMutablePointer<Int8>(malloc(capacity + 1))
        self.capacity   = capacity
    }
    
    deinit {
        free(bytes)
    }
}