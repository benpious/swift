// RUN: %target-run-simple-swift | %FileCheck %s
// REQUIRES: executable_test

// UNSUPPORTED: use_os_stdlib
// UNSUPPORTED: back_deployment_runtime

class MyLabel {
  var text = "label"
}

class Controller {
    
    func test() {
        
    }
}


let a = \Controller.test()
// CHECK: \Controller.test
print(a)
