//
//  ChooseHighest.swift
//  Yacht
//
//  Created by 노윤철 on 2021/11/13.
//

import Foundation

func chooseHighest(object: [decision]) -> [decision] {
    var currentHighest: Int = -100
    var newObject = [decision]()
    let objectCount = object.count
    for i in 0 ... objectCount - 1 {
        if object[i].priority > currentHighest {
            currentHighest = object[i].priority
        }
    }
    for i in 0 ...  objectCount - 1 {
        if object[i].priority >= currentHighest - 1 {
            newObject.append(object[i])
        }
    }
    return newObject
}


func quickSort(object: [[Int]]) -> [[Int]] {
    let n = object.count;
    var newObject = [[Int]]();
    var smallThings = [[Int]]();
    var bigThings = [[Int]]();
    assert(n > 0)
    if n > 2 {
        let standard = object[0][1];
        for i in 1 ... (n-1) {
            if object[i][1] < standard {
                smallThings.append(object[i]);
            }
            else {
                bigThings.append(object[i]);
            }
        }
        if bigThings.count != 0 {
            newObject = quickSort(object: bigThings);
        }
        newObject.append(object[0]);
        if smallThings.count != 0 {
            newObject = newObject + quickSort(object: smallThings);
        }
        return newObject;
    }
    if n == 2 {
        if object[0][1] < object[1][1] {
            newObject.append(object[1]);
            newObject.append(object[0]);
            return newObject;
        }
        else{
            return object;
        }
    }
    if n == 1 {
        newObject = object;
        return newObject;
    }
    else {
        return [[0]];
    }
}
