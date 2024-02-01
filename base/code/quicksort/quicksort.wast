(; https://gist.github.com/bellbind/556feb3c337209005e6a53d16c720aff ;)
(module
  (export "heap" (memory $0))
  (export "qsort" (func $qsortExport))
  (memory $0 1 256)
  (func $qsortExport (param $byteOffset i32) (param $length i32)
    (call $qsort
      (get_local $byteOffset)
      (i32.add
        (get_local $byteOffset)
        (i32.mul (i32.sub (get_local $length) (i32.const 1)) (i32.const 8))))
  )
  (func $qsort (param $begin i32) (param $end i32)
    (local $pivot f64)
    (local $tmp f64)
    (local $fw i32)
    (local $bw i32)
    (local $pidx i32)
    (if
      (i32.ge_s (i32.add (get_local $begin) (i32.const 8)) (get_local $end))
      (return))
    (set_local $pidx (i32.add
      (get_local $begin)
      (i32.shl
        (i32.shr_s
          (i32.sub (get_local $end) (get_local $begin))
          (i32.const 4))
        (i32.const 3))))
    (set_local $pivot (f64.load (get_local $pidx)))
    (set_local $fw (get_local $begin))
    (set_local $bw (get_local $end))
    (loop $loop-outer (block $out-outer
      (loop $loop-fw (block $out-fw
        (if
          (i32.eqz (f64.lt (f64.load (get_local $fw)) (get_local $pivot)))
          (br $out-fw))
        (set_local $fw (i32.add (get_local $fw) (i32.const 8)))
        (br $loop-fw)))

      (loop $loop-bw (block $out-bw
        (if
          (i32.eqz (f64.lt (get_local $pivot) (f64.load (get_local $bw))))
          (br $out-bw))
        (set_local $bw (i32.sub (get_local $bw) (i32.const 8)))
        (br $loop-bw)))

      (if
        (i32.ge_s (get_local $fw) (get_local $bw))
        (br $out-outer))

      (set_local $tmp (f64.load (get_local $fw)))
      (f64.store (get_local $fw) (f64.load (get_local $bw)))
      (f64.store (get_local $bw) (get_local $tmp))
      (set_local $fw (i32.add (get_local $fw) (i32.const 8)))
      (set_local $bw (i32.sub (get_local $bw) (i32.const 8)))
      (br $loop-outer)))

    (call $qsort (get_local $begin) (i32.sub (get_local $fw) (i32.const 8)))
    (call $qsort (i32.add (get_local $bw) (i32.const 8)) (get_local $end))
  )
)
