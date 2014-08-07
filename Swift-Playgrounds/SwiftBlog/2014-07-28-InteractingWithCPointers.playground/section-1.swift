// Playground - noun: a place where people can play

import Cocoa
import CoreGraphics
import XCPlayground
import Accelerate

var color = NSColor.magentaColor()
var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
color.getRed(&r, green: &g, blue: &b, alpha: &a)

var maybeError: NSError?
if let contents = NSFileManager.defaultManager().contentsOfDirectoryAtPath("/usr/bin", error: &maybeError) {
    println("\(contents)")
} else if let error = maybeError {
    println("\(error)")
}


let x: [Float] = [1, 2, 3, 4]
let y: [Float] = [0.5, 0.25, 0.125, 0.0625]
var result:[Float] = [0, 0, 0, 0]

vDSP_vadd(x, 1, y, 1, &result, 1, 4)
result

puts("Hello fromlibc")
let fd = open("/tmp/scratch.txt", O_WRONLY|O_CREAT, 0o666)
if fd < 0 {
    perror("could not open /tmp/scratch.txt")
} else {
    let text = "Hello World"
    write(fd, text, strlen(text))
    close(fd)
}


