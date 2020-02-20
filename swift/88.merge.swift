// Insert & sort
func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    for i in 0..<n {
        nums1[m + i] = nums2[i]
    }
    
    nums1.sort()
}

// Using full aux array
func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i1 = 0, i2 = 0;
    var aux = [Int](repeating: 0, count: m + n)

    for j in 0..<m + n {
        if i1 == m {
            aux[j] = nums2[i2]
            i2 += 1
        } else if i2 == n {
            aux[j] = nums1[i1]
            i1 += 1
        } else {
            if nums1[i1] < nums2[i2] {
                aux[j] = nums1[i1]
                i1 += 1
            } else {
                aux[j] = nums2[i2]
                i2 += 1
            }
        }
    }

    nums1 = aux
}

// Using halved aux array
func merge3(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var aux = [Int](repeating: 0, count: m)
    
    var i1 = 0, i2 = 0
    for j in 0..<m {
        if i1 == m {
            aux[j] = nums2[i2]
            i2 += 1
        } else if i2 == n {
            aux[j] = nums1[i1]
            i1 += 1
        } else if nums1[i1] < nums2[i2] {
            aux[j] = nums1[i1]
            i1 += 1
        } else {
            aux[j] = nums2[i2]
            i2 += 1
        }
    }
    for j in 0..<n {
        if i1 == m {
            nums1[j + m] = nums2[i2]
            i2 += 1
        } else if i2 == n {
            nums1[j + m] = nums1[i1]
            i1 += 1
        } else if nums1[i1] < nums2[i2] && i1 < m {
            nums1[j + m] = nums1[i1]
            i1 += 1
        } else {
            nums1[j + m] = nums2[i2]
            i2 += 1
        }
    }
    for j in 0..<m {
        nums1[j] = aux[j]
    }
}

// In-place insertion at end
func merge4(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i1 = m - 1, i2 = n - 1
    var j = m + n - 1
    while i2 >= 0 && i1 >= 0 {
        if nums1[i1] > nums2[i2] {
            nums1[j] = nums1[i1]
            i1 -= 1
        } else {
            nums1[j] = nums2[i2]
            i2 -= 1
        }
        j -= 1
    }
    if i2 >= 0 {
        for i in (0...i2).reversed() {
            nums1[j] = nums2[i]
            j -= 1
        }
    }
}