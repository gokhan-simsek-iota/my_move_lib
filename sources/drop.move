

module my_move_lib::drop;

/// This struct has the `drop` ability.
public struct AutoDrop has drop {}
    // A struct with a single drop ability is called a Witness
public fun new_auto_drop() : AutoDrop { AutoDrop {} }

/// This struct does not have the `drop` ability.
public struct ManualDrop {}


#[test]
// Create an instance of the `AutoDrop` struct and ignore it.
// Even though we constructed the instance, we don't need to unpack it.
fun test_ignore() {
    let manual_drop = ManualDrop {};
    let _auto_drop = AutoDrop { }; // no need to unpack

    // Manual drop by unpacking
    let ManualDrop {} = manual_drop; // OK
        // if this line commented:
        // error[E06001]: unused value without 'drop'
}
