//
//  GPA.swift
//  Parth_C0766346_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 Parth Dalwadi. All rights reserved.
//

import UIKit

class GPA: UIViewController {

    
    
    
    @IBOutlet var cource_name: [UILabel]!
    
    
    @IBOutlet var cource_marks: [UITextField]!
    
    
    @IBOutlet weak var gpa: UILabel!
    
    @IBOutlet weak var label_gpa: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func calculate_gpa(_ sender: UIButton) {
        
        var GPA = 0.0
        var total_credit = 0.0
    
        for i in cource_name.indices{
        
        let marks = Int(cource_marks[i].text!)
        let GP = Double(marks_to_GP(marks!))
            
        let credit = findCourceCredit(cource_name[i].text!)
        
    
            
        GPA += (GP * credit)
            
        total_credit += Double(findCourceCredit(cource_name[i].text!))
        
        }
    
        gpa.text! = String(format: "GPA %.2f / 4", (GPA/total_credit))
    
        
    
        
    }
    
    func marks_to_GP(_ marks: Int) -> Float{
        
        switch marks {
        case 94...100: return 4.0
        case 87...93: return 3.7
        case 80...86: return 3.5
        case 77...79: return 3.2
        case 73...76: return 3.0
        case 70...72: return 2.7
        case 67...69: return 2.3
        case 63...66: return 2.0
        case 60...62: return 1.7
        case 50...59: return 1.0
        case 0...49: return 0.0
        default: return 0.0
        }
        
    }
    
    func findCourceCredit(_ courceName: String) -> Double{
        
        return Double(String(courceName[courceName.index(before: courceName.endIndex)]))!

        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
