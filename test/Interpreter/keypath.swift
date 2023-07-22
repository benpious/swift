// RUN: %target-run-simple-swift | %FileCheck %s
// REQUIRES: executable_test

// UNSUPPORTED: use_os_stdlib
// UNSUPPORTED: back_deployment_runtime

class Controller {
    
    func test() {
        
    }
        
    subscript () -> () {
        ()
    }
    
}


//let a = \Controller.test()
// CHECK: \Controller.test
//print(a)
let b: KeyPath<Controller, ()> = \Controller.test()
//let b: KeyPath<Controller, ()> = \Controller.[]
// CHECK: \Controller.test
//print(b)
