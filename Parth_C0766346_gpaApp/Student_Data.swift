//
//  Student_Data.swift
//  Parth_C0766346_gpaApp
//
//  Created by Parth Dalwadi on 2019-11-13.
//  Copyright © 2019 Parth Dalwadi. All rights reserved.
//

import Foundation

struct Student{
    
    var first_name: String
    var last_name: String
    var full_name: String{
        
        return first_name + " " + last_name
        
    }
    var id: String
    var Marks =  Array(repeating: Array(repeating: 0, count: 5 ), count: 3)
    var GPA = Array(repeating: -1.0, count: 3 )
    var CGPA: Double{
        var total = 0.0
        var semCount = 0
        var isAvailable = false
        for gpa in GPA{
            
            if gpa != -1.0 {
                isAvailable = true
                
                total += gpa
                semCount += 1
            }
        }
        return isAvailable ? (total/Double(semCount)) : -1.0
    }
    
    static var all_Students_Info = [Student]()
    
}






