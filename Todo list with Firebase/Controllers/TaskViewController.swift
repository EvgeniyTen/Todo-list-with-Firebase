//
//  TaskViewController.swift
//  Todo list with Firebase
//
//  Created by Евгений Тимофеев on 18.03.2022.
//

import UIKit

class TaskViewController: UITableViewController {
    
    // MARK: - Properties
    
    
    let reuseIdentifire = "toDoCell"
    var todoItems = [TodoItem]() {
        didSet {
            print("td items was set")
            tableView.reloadData()
        }
    }
    
    lazy var createNewButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = .systemIndigo
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        
        button.addTarget(self, action: #selector(createNewTask), for: .touchUpInside)
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        PostService.shared.fetchAllItems { (allItems) in
            self.todoItems = allItems
        }
    }
    
    
    
    
    // MARK: - Selectors
    
    @objc func createNewTask() {
        let taskViewController = CreateTaskController()
        present(taskViewController, animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation
    func configureTableView() {
        tableView.backgroundColor = .white
        tableView.register(TodoCell.self, forCellReuseIdentifier: reuseIdentifire)
        tableView.rowHeight = 100
        tableView.separatorColor = .systemIndigo
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        tableView.tableFooterView = UIView()
        
        tableView.addSubview(createNewButton)
        createNewButton.anchor(bottom: tableView.safeAreaLayoutGuide.bottomAnchor, right: tableView.safeAreaLayoutGuide.rightAnchor, paddingBottom: 16, paddingRight: 16, width: 56, height: 56)
        createNewButton.layer.cornerRadius = 56 / 2
        createNewButton.alpha = 1
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifire, for: indexPath) as? TodoCell else { return UITableViewCell() }
        cell.todoItem = todoItems[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
