// RUN: %target-run-simple-swift | %FileCheck %s
// REQUIRES: executable_test

// UNSUPPORTED: use_os_stdlib
// UNSUPPORTED: back_deployment_runtime

class Controller {
    
    func test() {
        print("abc")
    }
        
    subscript () -> () {
        ()
    }
    
}


let a = \Controller.test()
// CHECK: abc
Controller()[keyPath: a]
//let b: KeyPath<Controller, ()> = \Controller.test()
//let b: KeyPath<Controller, ()> = \Controller.[]
