//
//  SemList.swift
//  Parth_C0766346_gpaApp
//
//  Created by Parth Dalwadi on 2019-11-15.
//  Copyright © 2019 Parth Dalwadi. All rights reserved.
//

import UIKit

class SemList: UITableViewController {
    var semIndex = -1
    var stuIndex = -1
    var d_studentList: Student_List?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stuIndex = d_studentList!.stu_index
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Cource.semList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "sem"){
        cell.textLabel?.text = Cource.semList[indexPath.row]
            
        cell.detailTextLabel?.text = String(format: "%.1f",Student.all_Students_Info[stuIndex].GPA[indexPath.row])
        // Configure the cell...

            return cell
            
        }
        
        return UITableViewCell()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    override func viewWillDisappear(_ animated: Bool) {
        d_studentList?.tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let gpaV = segue.destination as? GPA{
            gpaV.d_semList = self
            
            if let semCell = sender as? UITableViewCell{
                semIndex = tableView.indexPath(for: semCell)!.row
                
            }
        }
        
        
    }
    

}
