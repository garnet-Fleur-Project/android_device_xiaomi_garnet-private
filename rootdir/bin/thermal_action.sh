#!/vendor/bin/sh
# Thermal Disable/Enable script

ACTION=$1

if [ "$ACTION" == "1" ]; then
    stop mi_thermald
    stop vendor.thermal-hal-2-0
    stop thermald

    for cpu in /sys/devices/system/cpu/cpu*/core_ctl/enable; do
        if [ -e "$cpu" ]; then
            echo "0" > "$cpu"
            chmod 444 "$cpu"
        fi
    done

    for kgsl in /sys/class/kgsl/kgsl-3d0; do
        if [ -d "$kgsl" ]; then
            echo "0" > "$kgsl/throttling"
            echo "0" > "$kgsl/max_gpuclk"
            echo "1" > "$kgsl/force_clk_on"
            echo "0" > "$kgsl/thermal_pwrlevel"
        fi
    done

    setprop debug.thermal.throttle.support no

elif [ "$ACTION" == "0" ]; then
    for cpu in /sys/devices/system/cpu/cpu*/core_ctl/enable; do
        if [ -e "$cpu" ]; then
            chmod 644 "$cpu"
            echo "1" > "$cpu"
        fi
    done

    for kgsl in /sys/class/kgsl/kgsl-3d0; do
        if [ -d "$kgsl" ]; then
            echo "1" > "$kgsl/throttling"
            echo "1" > "$kgsl/thermal_pwrlevel"
        fi
    done

    start mi_thermald
    start vendor.thermal-hal-2-0
    start thermald

    setprop debug.thermal.throttle.support yes
fi
