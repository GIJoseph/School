
var i = 0
let hello = "Hello, playground!"

start: do {
    i += 1
    
    do {
        print(hello)
        
        if i < 3 {
            continue start
        }
    }
}
