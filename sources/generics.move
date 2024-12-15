module my_move_lib::generics;

use std::ascii::String;
use std::type_name::{Self, TypeName};

/// A function that returns the name of the type `T` and its module and address.
public fun do_i_know_you<T>(): (String, String, String) {
    let type_name: TypeName = type_name::get<T>();

    let module_name: String = type_name.get_module();
    let address_str: String = type_name.get_address();
    let str = type_name.into_string();

    (str, module_name, address_str)
}

#[test_only]
public struct Foo {}

#[test]
fun test_generic_fn() {
    let (_, module_name, _) = do_i_know_you<Foo>();
    
    assert!(module_name == b"generics".to_ascii_string());
}
