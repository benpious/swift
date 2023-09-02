// RUN: %target-run-simple-swift | %FileCheck %s
// REQUIRES: executable_test

// UNSUPPORTED: use_os_stdlib
// UNSUPPORTED: back_deployment_runtime

protocol P {
    
    func test()
    
}

struct S {
    func abc() {
        print("f")
    }
}

@dynamicMemberLookup
class Controller: P {
    
    var toPrint = "abc"
    
    func test() {
        print(toPrint)
    }
    
    func r<T>(_ t: T) {
        print(t)
    }
    
    subscript<T>(dynamicMember member: KeyPath<S, T>) -> T {
        S()[keyPath: member]
    }
            
}

class MyController: Controller {
    
    override func test() {
        print("efg")
    }
    
}


let a = \Controller.test()
//// CHECK: abc
//let c = Controller()
//c[keyPath: a]
//c.toPrint = "bcg"
//// CHECK: bcg
//c[keyPath: a]
//let kps = \MyController.test()
let myC = MyController()
//// CHECK: efg
//myC[keyPath: kps]
//c.abc()
// CHECK: efg
//myC[keyPath: a]
//let kpg: KeyPath<Controller, ()> = \Controller.r(7)
//// CHECK: 7
//c[keyPath: kpg]
let kpp = \P.test()
// CHECK: bcg
myC[keyPath: kpp]
