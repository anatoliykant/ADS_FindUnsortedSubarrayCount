import UIKit

/// Найти количество элементов в подмассиве,
/// при сортировке которых основной массив станет отсортированным

// Сложность O(n)

let firstArray = [1, 4, 3, 2, 6]
let secondArray = [6, 4, 10, 10, 4, 15]
let thirdArray = [1, 4, 3, 2, 6, 6, 4, 10, 10, 4, 15]
let fouthArray = [1, 4, 2, 4, 2, 6]
let fifthArray = [1, 1, 1, 1, 1]
let sixthArray: [Int] = []

// 1. С помощью методов и переменных массива

func findUnsortedSubarrayCount1(in array: [Int]) -> Int {
	
	guard array.count > 0 else { return 0 }
	
	var newArray = array
	
	getUnsortedSubarrayAtBeginning(of: &newArray)
	getUnsortedSubarrayFromEnd(of: &newArray)
	
	return newArray.count
}

func getUnsortedSubarrayAtBeginning(of array: inout [Int]) -> [Int] {
	
	guard array.count > 0 else { return [] }
	
	if array.first == array.min() {
		array.removeFirst()
		return getUnsortedSubarrayAtBeginning(of: &array)
	} else {
		return array
	}
}

func getUnsortedSubarrayFromEnd(of array: inout [Int]) -> [Int] {
	
	guard array.count > 0 else { return [] }
	
	if array.last == array.max() {
		array.removeLast()
		return getUnsortedSubarrayFromEnd(of: &array)
	} else {
		return array
	}
}

findUnsortedSubarrayCount1(in: firstArray)

// 2. С помощью стандартных средств языка

func findUnsortedSubarrayCount2(in array: [Int]) -> Int {
	
	guard array.count > 0 else { return 0 }
	
	var maxElement: Int!
	var minElement: Int!
	
	var maxIndex: Int!
	var minIndex: Int!
	
	for (index, element) in array.enumerated() {
		if maxElement == nil || element > maxElement {
			maxElement = element
		} else if element != maxElement {
			maxIndex = index
		}
	}
	
	for (index, element) in array.reversed().enumerated() {
		if minElement == nil || element < minElement {
			minElement = element
		} else if element != minElement {
			minIndex = array.count - index - 1
		}
	}
	
	guard maxIndex != nil, minIndex != nil else { return 0 }
	
	let count = maxIndex - minIndex + 1
	return count
}

findUnsortedSubarrayCount2(in: firstArray)
