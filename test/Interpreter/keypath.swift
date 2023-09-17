// RUN: %target-run-simple-swift | %FileCheck %s
// REQUIRES: executable_test

// UNSUPPORTED: use_os_stdlib
// UNSUPPORTED: back_deployment_runtime

struct S {
    
    func abc() {
        
    }
    
    var a: Int = 8
}

@dynamicMemberLookup
class Controller {
        
    subscript<T>(dynamicMember member: KeyPath<S, T>) -> T {
//        S()[keyPath: member]
        fatalError()
    }
    
    func f() {
        
    }
    
    subscript(i: Int) -> () {
        ()
    }
            
}

let c = Controller()
//c[8]
//c.f()
// CHECK: f
c.abc()
//_ = c.a
//Controller().abc()
