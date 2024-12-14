module my_move_lib::type_reflection;

use std::type_name::{Self, TypeName};

#[test_only]
public struct Foo {}

#[test]
fun test_type_reflection() {
    let type_name: TypeName = type_name::get<Foo>();
    let addr_str = type_name.get_address();
    let module_name = type_name.get_module();

    std::debug::print(&b"addr_str:".to_string());
    std::debug::print(&addr_str);
    std::debug::print(&b"-------------------------".to_string());

    std::debug::print(&b"module_name:".to_string());
    std::debug::print(&module_name);
    std::debug::print(&b"--------------------------".to_string());

    std::debug::print(&b"type_name:".to_string());
    std::debug::print(&type_name.into_string()); 
        // or type_name.borrow_string();
    std::debug::print(&b"--------------------------".to_string());

    assert!(module_name == b"type_reflection".to_ascii_string());
}
/* 
[debug] "addr_str:"
[debug] "0000000000000000000000000000000000000000000000000000000000000000"
[debug] "-------------------------"
[debug] "module_name:"
[debug] "type_reflection"
[debug] "--------------------------"
[debug] "type_name:"
[debug] "0000000000000000000000000000000000000000000000000000000000000000::type_reflection::Foo"
[debug] "--------------------------"
*/
