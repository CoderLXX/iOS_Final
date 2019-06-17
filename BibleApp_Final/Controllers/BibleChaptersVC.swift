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
        
        print(book)
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
            chapterCell.chapterNumLbl.text = String(indexPath.row)
        }
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
