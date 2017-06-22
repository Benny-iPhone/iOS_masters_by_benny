//: Playground - noun: a place where people can play

import UIKit

func isMagicMatrix(_ arr : [[Int]]) -> Bool{
    
    let len = arr.count
    
    var testSum = 0
    for num in arr[0]{
        testSum += num
    }
    
    var diag1 = 0
    var diag2 = 0
    
    for i in 0..<len{
        
        diag1 += arr[i][i]
        diag2 += arr[i][len - 1 - i]
        
        var row = 0
        var column = 0
        
        for j in 0..<len{
            
            row += arr[i][j]
            column += arr[j][i]
            
        }
        
        if row != testSum{
            return false
        }
        
        if column != testSum{
            return false
        }
        
    }
    
    if diag1 != testSum{
        return false
    }
    
    if diag2 != testSum{
        return false
    }
    
    return true
    
}


let mat = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]

let mat1 : [[Int]] = [
    [1,1,1],
    [1,1,1],
    [1,1,1]
]

let mat2 : [[Int]] = [
    [2,9,4],
    [7,5,3],
    [6,1,8]
]

isMagicMatrix(mat)
isMagicMatrix(mat1)
isMagicMatrix(mat2)

