//
//  URL+CoreKit.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 16.08.2021.
//

import UIKit

extension URL {
    static func saveURL(pathComponent: String) -> URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentDirectory.appendingPathComponent(pathComponent)
        return fileURL
    }
}
