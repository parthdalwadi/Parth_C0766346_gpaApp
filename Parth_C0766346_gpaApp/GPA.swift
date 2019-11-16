//
//  GPA.swift
//  Parth_C0766346_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 Parth Dalwadi. All rights reserved.
//

import UIKit
import AVFoundation
class GPA: UIViewController {

    
    var audioplayer: AVAudioPlayer!
    var d_semList: SemList?
    @IBOutlet var cource_name: [UILabel]!
    
    
    
    @IBOutlet var cource_marks: [UITextField]!
    

    
    @IBOutlet weak var label_gpa: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in cource_name.indices{
            
            cource_name[i].text = Cource.subjects[d_semList!.semIndex][i]
            cource_marks[i].text = String(Student.all_Students_Info[d_semList!.stuIndex].Marks[d_semList!.semIndex][i])
            
            
        }

        label_gpa.text! = String(format: "GPA: %.2f / 4", Student.all_Students_Info[d_semList!.stuIndex].GPA[d_semList!.semIndex])
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func calculate_gpa(_ sender: UIButton) {
        
        
        
        
        var isMarksEmpty: Bool = false
        
        for m in cource_marks{
            
            if m.text == "" {isMarksEmpty = true; error_msg(); break}
            
            
        }
        
        if !isMarksEmpty{
                
            
            
            var totalGP = 0.0
            var total_credit = 0.0
            var g_p_a = 0.0
        
            for i in cource_name.indices{
            
                
                
            let marks = Int(cource_marks[i].text!)
            
            Student.all_Students_Info[d_semList!.stuIndex].Marks[d_semList!.semIndex][i] = marks!
            
            
            let GP = Double(marks_to_GP(marks!))
                
            let credit = findCourceCredit(cource_name[i].text!)
            
        
                
            totalGP += (GP * credit)
                
            total_credit += Double(findCourceCredit(cource_name[i].text!))
            
            }
            
            g_p_a = totalGP/total_credit
            
            Student.all_Students_Info[d_semList!.stuIndex].GPA[d_semList!.semIndex] = g_p_a
            
        
            label_gpa.text! = String(format: "GPA: %.2f / 4", (g_p_a))
        
            if g_p_a >= 2.8 { playMusic() }
            
        }
    }
    
    func error_msg(){
        
        let aC = UIAlertController(title: nil, message: "Please fill marks for all subjects!", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        aC.addAction(ok)
        self.present(aC, animated: true, completion: nil)
        
    }
    
    func playMusic(){
        
        
        let soundURL = Bundle.main.url(forResource: "Win", withExtension: "wav")
        audioplayer = try! AVAudioPlayer(contentsOf: soundURL!)
        audioplayer.play()
        
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
    
    override func viewWillDisappear(_ animated: Bool) {
        d_semList?.tableView.reloadData()
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
