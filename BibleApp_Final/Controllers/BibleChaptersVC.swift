//
//  BibleChaptersVC.swift
//  BibleApp_Final
//
//  Created by liuxing on 6/15/19.
//  Copyright © 2019 Jeremy_Liu. All rights reserved.
//

import UIKit

private let kChaptersCellIdentifier = "kChaptersCell"

class BibleChaptersVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var book: Book?
    
    /// The collection view's flow layout.
    private var flowLayout: UICollectionViewFlowLayout? {
        return collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
    }
    
    override func loadView() {
        super.loadView()
        
        flowLayout?.minimumLineSpacing = 5
        flowLayout?.minimumInteritemSpacing = 5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = book?.fullName
    }

    // MARK: -Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectedCell = sender as? BibleChaptersCell {
            if let indexPath = collectionView?.indexPath(for: selectedCell) {
                if let versesController = segue.destination as? BibleVersesVC {
                    versesController.selectedBook = book
                    versesController.selectedChapterNum = indexPath.row + 1
                }
            }
        }
    }
    
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (book?.chapters)!
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kChaptersCellIdentifier, for: indexPath)
    
        if let chapterCell = cell as? BibleChaptersCell {
            chapterCell.chapterNumLbl.text = String(indexPath.row + 1)
        }
    
        return cell
    }

}
