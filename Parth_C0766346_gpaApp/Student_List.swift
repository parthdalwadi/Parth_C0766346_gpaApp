//
//  Student_List.swift
//  Parth_C0766346_gpaApp
//
//  Created by Parth Dalwadi on 2019-11-13.
//  Copyright © 2019 Parth Dalwadi. All rights reserved.
//

import UIKit

class Student_List: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    var filteredData = [Student]()
    var stu_index = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        self.searchBar.endEditing(true)
        filteredData = Student.all_Students_Info
        searchBar.delegate = self
        
        
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // hides the keyboard.
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "s_name", for: indexPath)
        
        cell.textLabel?.text = filteredData[indexPath.row].full_name
        let cgpa = Student.all_Students_Info[indexPath.row].CGPA
        cell.detailTextLabel?.text = (cgpa == -1.0) ? "CGPA: NA" : String(format: "CGPA: %.1f", cgpa)
        // Configure the cell...
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? Student.all_Students_Info : Student.all_Students_Info.filter { (item: Student) -> Bool in
                
            
            return item.full_name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
            
            tableView.reloadData()
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let reg = segue.destination as? Registration{
            
            reg.d_studentList = self
            
        }
        
        if let sems = segue.destination as? SemList{
            
            sems.d_studentList = self
        
            if let studentCell = sender as? UITableViewCell{
                let profile = filteredData[tableView.indexPath(for: studentCell)!.row]
                
                for i in Student.all_Students_Info.indices{
                    
                    if Student.all_Students_Info[i].id == profile.id {stu_index = i; break}
                    
                }
   
            }
            
        }
    }
    

}
