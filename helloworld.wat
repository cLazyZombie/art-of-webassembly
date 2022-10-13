(module
    (func $print_string (import "env" "print_string") (param i32))
    (memory (import "env" "buffer") 1)
    (global $start_string (import "env" "start_string") i32)
    (data (global.get $start_string) "hello world!")
    (global $string_len i32 (i32.const 12))
    (func $helloworld (export "helloworld")
        (call $print_string (global.get $string_len))
    )
    (global $my_value (export "my_value") i32 (i32.const 42))
)