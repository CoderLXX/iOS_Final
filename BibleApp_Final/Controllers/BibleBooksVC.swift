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
    
    
    
    enum Section: Int {
        case newTestament = 0
        case oldTestament
    }
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
   
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectedCell = sender as? UITableViewCell {
            if let chapterController = segue.destination as? BibleChaptersVC {
                print("hahahah00000000")
                chapterController.text1 = "Chapter"
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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kBooksCellIdentifier)
        if let bookCell = cell as? BibleBooksCell {
            bookCell.bookNameLbl.text = "创世记"
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.chapterVC.text1 = "chuangshiji"
//        self.navigationController?.pushViewController(self.chapterVC, animated: true)
    }
}

