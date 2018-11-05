//
//  ViewController.swift
//  BaseSort
//
//  Created by YGZ on 2018/11/5.
//  Copyright © 2018 YGZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let arr = [31, 2, 4, 1, 3, 2]
        let result = quickSort(s: arr, l: 0, r: arr.count - 1)
        print(result)
    }
    
    private func bubbleSort<T: Comparable>(s: [T]) -> [T] { //稳定
        var tempS = s
        if tempS.count > 0 {
            for i in 0..<(tempS.count - 1) {
                for j in 0..<(tempS.count - 1 - i) {
                    if tempS[j] > tempS[j + 1] {
                        let a = tempS[j]
                        tempS[j] = tempS[j + 1]
                        tempS[j + 1] = a
                    }
                }
            }
        }
        return tempS
    }
    
    private func selectSort<T: Comparable>(s: [T]) -> [T] { //不稳定
        var tempS = s
        if tempS.count > 0 {
            for i in 0..<(tempS.count - 1) {
                var minIdx = i
                for j in (i + 1)..<tempS.count {
                    if tempS[j] < tempS[minIdx] {
                        minIdx = j
                    }
                }
                let a = tempS[i]
                tempS[i] = tempS[minIdx]
                tempS[minIdx] = a
            }
        }
        return tempS
    }
    
    private func insertSort<T: Comparable>(s: [T]) -> [T] { //稳定
        var tempS = s
        if tempS.count > 0 {
            for i in 1..<(tempS.count) {
                let a = tempS[i]
                var perIdx = i - 1
                while(perIdx >= 0 && tempS[perIdx] > a) {
                    tempS[perIdx + 1] = tempS[perIdx]
                    perIdx -= 1
                }
                tempS[perIdx + 1] = a
            }
        }
        return tempS
    }
    
    private func quickSort<T: Comparable>(s: [T], l: Int, r: Int) -> [T] { //不稳定
        var tempS = s
        if l < r {
            let a = s[l]
            var i = l
            var j = r
            while(i < j && tempS[j] >= a) {
                j -= 1
            }
            if i < j {
                tempS[i] = tempS[j]
                i += 1
            }
            while(i < j && tempS[i] < a) {
                i += 1
            }
            if i < j {
                tempS[j] = tempS[i]
            }
            tempS[i] = a
            tempS = quickSort(s: tempS, l: l, r: i - 1)
            tempS = quickSort(s: tempS, l: i + 1, r: r)
        }
        return tempS
    }


}

