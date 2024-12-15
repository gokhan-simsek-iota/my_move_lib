
// https://move-book.com/storage/key-ability.html

module my_move_lib::key {

    use std::string::String;

    // * Because the first field of an object struct must be UID - a non-copyable 
    // and  non-droppable type, the struct transitively cannot have drop and
    // copy abilities. Thus, the object is non-discardable by design.
    public struct Foo has key, store {
        id: UID, // required
            // * Iota verifier will require the first field of the struct 
            // to be named id and have the type UID.           
        name: String
    }


    /// Creates a new Object with a Unique ID
    public fun new(name: String, ctx: &mut TxContext): Foo {
        Foo {
            id: object::new(ctx),
            name
        }
    }

    #[test]
    fun test_new() {
        let mut ctx = tx_context::dummy();
        let foo = new(b"foo3".to_string(), &mut ctx);

        // debug
        let id_addr = foo.id.uid_to_address();
        std::debug::print(&foo.id);
        std::debug::print(&id_addr);
        std::debug::print(&foo.name);

        assert!(foo.name == b"foo3".to_string());

        let dummy_address = @0xCAFE;
        transfer::public_transfer(foo, dummy_address);
    }
    /* 
    [debug] 0x2::object::UID {
    id: 0x2::object::ID {
        bytes: @0x381dd9078c322a4663c392761a0211b527c127b29583851217f948d62131f409
    }
    }
    [debug] @0x381dd9078c322a4663c392761a0211b527c127b29583851217f948d62131f409
    [debug] "abc"
    */
}