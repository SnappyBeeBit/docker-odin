package main

import "core:time"
import dt "core:time/datetime"
import tz  "core:time/timezone"
import "core:fmt"
import os "core:os/os2"


main :: proc () {
    data, err := os.read_entire_file( "usr/share/zoneinfo", context.allocator)
    if err != nil {
        fmt.println(os.error_string(err))
    }
    fmt.println(string(data))
    
    tog_tz, tog_load_ok := tz.region_load("Pacific/Tongatapu")
    fmt.println(tog_load_ok)
    fmt.println(tog_tz)
}
