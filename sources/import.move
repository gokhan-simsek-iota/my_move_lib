module my_move_lib::import;

// importing here
use my_move_lib::drop::new_auto_drop;
// or
use my_move_lib::drop::Self;


#[test]
fun test_import() {
    let _ = new_auto_drop();
    // or
    let _ = drop::new_auto_drop();
}
