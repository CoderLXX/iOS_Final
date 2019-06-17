//
//  ViewController.swift
//  BibleApp_Final
//
//  Created by liuxing on 6/11/19.
//  Copyright © 2019 Jeremy_Liu. All rights reserved.
//

import UIKit
import SQLite3

private let kBooksCellIdentifier = "kBooksCellIdentifier"

class BibleBooksVC: UITableViewController {

    // MARK: Properities
//    let chapterVC = BibleChaptersVC()
    
    
    
    var books: [Book] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var destinationVC: BibleChaptersVC?
    
    
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        books = Bible.getBooks()
        for book in books {
            
        }
        
    }
   
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectedCell = sender as? BibleBooksCell {
            if let indexPath = tableView.indexPath(for: selectedCell) {
                if let chapterController = segue.destination as? BibleChaptersVC {
                    if indexPath.section == 0 {
                        chapterController.book = books[indexPath.row]
                    } else {
                        chapterController.book = books[indexPath.row + 39]
                    }
                }
            }
        }
    }
    
    
    // MARK: Table view delegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "旧约"
        } else {
            return "新约"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 39
        }
        return books.count - 39
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kBooksCellIdentifier)
        if let bookCell = cell as? BibleBooksCell {
            if indexPath.section == 0 {
                bookCell.bookNameLbl.text = books[indexPath.row].fullName
                
            } else {
                bookCell.bookNameLbl.text = books[indexPath.row + 39].fullName
            }
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.chapterVC.text1 = "chuangshiji"
//        self.navigationController?.pushViewController(self.chapterVC, animated: true)
//        print("hhsh")
    }
}

