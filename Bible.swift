//
//  File.swift
//  Simple Bible - Final Project
//
//  Created by yzhao on 6/11/19.
//  Copyright © 2019 yzhao. All rights reserved.
//

import Foundation
import SQLite

class Bible {
    static private let dbFileName = "bible_cuv.db"
    static private let dbFilePath = Bundle.main.bundlePath + "/" + dbFileName
    static private let db = try? Connection(dbFilePath)
    
    static let oldtestamentBooks = 39
    
    static let newtestamentBooks = 27
    
    static func getBooks() ->[Book] {
        let rows = try! db!.prepare(BookTable.table)
        return rows.map({ Book(id: $0[BookTable.id], chapters: $0[BookTable.chapters], shortName: $0[BookTable.shortName], fullName: $0[BookTable.fullName])})
    }
    
    static func getBookById(_ id: Int) -> Book? {
        if let row = try! db!.prepare(BookTable.table).first(where: { $0[BookTable.id] == id }) {
            return Book(id: row[BookTable.id], chapters: row[BookTable.chapters], shortName: row[BookTable.shortName], fullName: row[BookTable.fullName])
        } else {
            return nil
        }
    }
    
    static func getChapterVerses(bookId: Int, chapterId: Int) -> [Verse] {
        let query = VerseTable.table.filter(VerseTable.bookId == bookId && VerseTable.chapterId == chapterId)
        let rows = try! db!.prepare(query)
        return rows.map { Verse(bookId: $0[VerseTable.bookId], chapterId: $0[VerseTable.chapterId], verseId: $0[VerseTable.verseId], text: $0[VerseTable.text])}
        
    }
    
}

struct BookTable {
    static let table = Table("BibleID")
    static let id = Expression<Int>("SN")
    static let chapters = Expression<Int>("ChapterNumber")
    static let shortName = Expression<String>("ShortName")
    static let fullName = Expression<String>("FullName")
}

struct Book {
    let id: Int
    let chapters: Int
    let shortName: String
    let fullName: String
}

struct VerseTable {
    static let table = Table("Bible")
    static let bookId = Expression<Int>("VolumeSN")
    static let chapterId = Expression<Int>("ChapterSN")
    static let verseId = Expression<Int>("VerseSN")
    static let text = Expression<String>("Lection")
}

struct Verse {
    let bookId: Int
    let chapterId: Int
    let verseId: Int
    let text: String
}
