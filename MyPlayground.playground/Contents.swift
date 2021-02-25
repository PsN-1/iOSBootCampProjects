import Foundation

var width: Float = 3.4
var height: Float = 2.1

var bucketOfPaint: Int {
    get {
        return Int(ceilf(width * height / 1.5))
    }
    set {
        let area = Double(newValue) * 1.5
        print(area)
    }
}

bucketOfPaint = 8

print(bucketOfPaint)

//1 - 1.5 m2

