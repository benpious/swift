// RUN: %target-run-simple-swift | %FileCheck %s
// REQUIRES: executable_test

// UNSUPPORTED: use_os_stdlib
// UNSUPPORTED: back_deployment_runtime

class S {
    
    func abc() {
        print("f")
    }
    
    var a: Int = 8
}

class TT: S {
  
  override func abc() {
    print("g")
  }
  
}

@dynamicMemberLookup
class Controller {
        
    subscript<T>(dynamicMember member: KeyPath<S, T>) -> T {
        TT()[keyPath: member]
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
// CHECK: g
c.abc()
//_ = c.a
//Controller().abc()
