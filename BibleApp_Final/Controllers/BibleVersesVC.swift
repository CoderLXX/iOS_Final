//
//  BibleVersesVC.swift
//  BibleApp_Final
//
//  Created by liuxing on 6/15/19.
//  Copyright © 2019 Jeremy_Liu. All rights reserved.
//

import UIKit

private let kVersesCellIdentifier = "kVersesCellIdentifier"

class BibleVersesVC: UITableViewController {
    
    
    var versesTexts: [Verse]?
    var selectedBook: Book?
    var selectedChapterNum: Int? {
        didSet {
            versesTexts = Bible.getChapterVerses(bookId: (selectedBook?.id)!, chapterId: self.selectedChapterNum!)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(selectedBook?.fullName ?? "") \(String(selectedChapterNum!))章"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (versesTexts?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kVersesCellIdentifier", for: indexPath)

        if let verseCell = cell as? BibleVersesCell {
            verseCell.verseTextLbl.text = "\(indexPath.row + 1).\(versesTexts![indexPath.row].text)"
        }

        return cell
    }

}
