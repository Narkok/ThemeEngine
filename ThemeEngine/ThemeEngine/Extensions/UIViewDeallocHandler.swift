//
//  UIViewDeallocHandler.swift
//  ThemeEngine
//
//  Created by Narek Stepanyan.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2023 Narek Stepanyan.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import Foundation

/// UIViewDeallocHandler is an internal helper class that allows executing a closure when an instance of the class is deallocated.
///
/// This class is used in conjunction with NSObject extensions to clean up resources such as notification observers.
internal class UIViewDeallocHandler {
    
    /// The closure that will be executed when the `UIViewDeallocHandler` instance is deallocated.
    private let closure: () -> Void

    /// Initializes a new instance of `UIViewDeallocHandler` with the provided closure.
    ///
    /// - Parameter closure: The closure to be executed when the instance is deallocated.
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    /// When the `UIViewDeallocHandler` instance is deallocated, the closure provided during initialization is executed.
    deinit { closure() }
}
