//
//  RepositoryTask.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/10.
//

import Foundation

class RepositoryTask: Cancellable {
    var networkTask: NetworkCancellable?
    var isCancelled: Bool = false
    
    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
}
