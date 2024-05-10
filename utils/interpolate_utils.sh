#!/bin/sh

do_color_interpolation() {
	local all_interpolated="$1"

	for ((i=0; i<${#color_interpolation[@]}; i++)); do
		all_interpolated=${all_interpolated//${color_interpolation[$i]}/${color_values[$i]}}
	done

	echo "$all_interpolated"
}
