(module
    (func $eq_2 (param $n i32) (result i32) 
        (i32.eq (local.get $n) (i32.const 2))
    )
    (func $multiple_check (param $n i32) (param $m i32) (result i32)
        (i32.rem_u (local.get $n) (local.get $m))
        i32.eqz
    )
    (func $even_check (param $n i32) (result i32)
        (i32.rem_u (local.get $n) (i32.const 2))
        i32.eqz
    )
    (func $is_prime (export "is_prime") (param $n i32) (result i32)
        (local $i i32)
        (if (call $eq_2 (local.get $n))
        (then 
            i32.const 1
            return
        ))

        (block $not_prime   
            (br_if $not_prime (i32.eq (local.get $n) (i32.const 1)))
            (br_if $not_prime (call $even_check (local.get $n)))

            (local.set $i (i32.const 1))
            (loop $prime_test_loop
                (local.tee $i (i32.add (local.get $i) (i32.const 2)))
                local.get $n

                i32.ge_u
                if
                    i32.const 1
                    return
                end

                (br_if $not_prime (call $multiple_check (local.get $n) (local.get $i)))
                ;; br_if $not_prime
                br $prime_test_loop
            )
        )
        i32.const 0
    )
)