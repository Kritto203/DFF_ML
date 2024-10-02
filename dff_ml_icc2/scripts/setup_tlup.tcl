proc setup_tlup {tlup_min tlup_max tlup_map} {

	read_parasitic_tech \
		-tlup $tlup_max \
		-layermap $tlup_map \
		-name tlup_max
		
	read_parasitic_tech \
		-tlup $tlup_min \
		-layermap $tlup_map \
		-name tlup_min
		
	set_parasitics_parameters \
		-early_spec tlup_min \
		-late_spec tlup_min \
		-corners {fast}
		
	set_parasitics_parameters \
		-early_spec tlup_max \
		-late_spec tlup_max \
		-corners {slow}

	report_parasitic_parameters

	set_extraction_options -late_ccap_threshold 0.0005 \
				-early_ccap_threshold 0.0005 \
				-honor_mask_constraints true \
				-real_metalfill_extraction floating \
				-virtual_shield_extraction false \
				-corners {fast slow}

}
