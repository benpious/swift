// RUN: %target-run-simple-swift | %FileCheck %s
// REQUIRES: executable_test

// UNSUPPORTED: use_os_stdlib
// UNSUPPORTED: back_deployment_runtime

struct S {
    func abc() {
        print("f")
    }
}

@dynamicMemberLookup
class Controller {
        
    subscript<T>(dynamicMember member: KeyPath<S, T>) -> T {
        S()[keyPath: member]
    }
    
    func f() {
        
    }
            
}


let c = Controller()
//c.f()
// CHECK: f
c.abc()
//Controller().abc()
