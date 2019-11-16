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
    var id: String
    var Marks =  Array(repeating: Array(repeating: 0, count: 5 ), count: 3)
    var GPA = Array(repeating: 0.0, count: 3 )
    var CGPA: Double{
        return (GPA[0] + GPA[1] + GPA[2])/Double(GPA.count)
    }
    
    static var all_Students_Info = [Student]()
    
}






