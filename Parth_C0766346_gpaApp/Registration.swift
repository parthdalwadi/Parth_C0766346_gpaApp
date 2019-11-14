//
//  Registration.swift
//  Parth_C0766346_gpaApp
//
//  Created by Parth Dalwadi on 2019-11-13.
//  Copyright © 2019 Parth Dalwadi. All rights reserved.
//

import UIKit

class Registration: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var id: UITextField!
    var d_studentList: Student_List?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveData(_ sender: UIButton) {
        
        
        guard self.firstName.text != "" && self.lastName.text != "" && self.id.text != "" else{
                       
        self.error_msg() ; return }
        
        saveAlert()
        
    }
    
    func saveAlert(){
        
        let aC = UIAlertController(title: nil, message: "Are you sure ?", preferredStyle: .actionSheet)
        
        let n = UIAlertAction(title: "No Way!", style: .cancel, handler: nil)
        let y = UIAlertAction(title: "Yes, I'm Sure!", style: .default, handler: { (action) in
            
           
            self.contactSavedAlert()
            
        })
        aC.addAction(n)
        aC.addAction(y)
        self.present(aC, animated: true, completion: nil)
        
        
    }

        func contactSavedAlert(){
            
            let aC = UIAlertController(title: "New Contact Saved", message: "\(firstName.text!) is now a student.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: {(action) in
            let s = Student(first_name: self.firstName.text!, last_name: self.lastName.text!, id: self.id.text!)
            Student.all_Students_Info.append(s)
            
                print(Student.all_Students_Info)
            self.firstName.text = ""
            self.lastName.text = ""
            self.id.text = ""
            
                
                
            })
            
            aC.addAction(ok)
            self.present(aC, animated: true, completion: nil)
        }
        
        func error_msg(){
            
            let aC = UIAlertController(title: nil, message: "Please fill all the details!", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            aC.addAction(ok)
            self.present(aC, animated: true, completion: nil)
            
        }
        
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillDisappear(_ animated: Bool) {
        
        
        d_studentList?.updateStudentList()
        
        
    }
}
