package main

import "core:time"
import dt "core:time/datetime"
import tz  "core:time/timezone"
import "core:fmt"
import os2 "core:os/os2"
import os "core:os"

main :: proc () {
   /* data, err := os.read_entire_file( "usr/share/zoneinfo", context.allocator)
    if err != nil {
        fmt.println(os.error_string(err))
    }
    fmt.println(string(data))
    
    tog_tz, tog_load_ok := tz.region_load("Pacific/Tongatapu")
    fmt.println(tog_load_ok)
    fmt.println(tog_tz)
    */
    local_str, ok := os.lookup_env("TZ", context.allocator)
    fmt.println(local_str)
    fmt.println(ok)
    
    r, rok := tz.region_load(local_str, context.allocator)
    fmt.println(r)
	fmt.println(rok)
    
    dst_dt, _ := dt.components_to_datetime(2024, 10, 4, 23, 47, 0)
	std_dt, _ := dt.components_to_datetime(2024, 11, 4, 23, 47, 0)
    
	local_tz, local_load_ok := tz.region_load("local")
	fmt.println(local_tz)
	fmt.println(local_load_ok)
	//defer tz.region_destroy(local_tz)
}
