local setup, leap = pcall(require, "leap")
if not setup then
	return
end

-- configure/enable leap
leap.add_default_mappings()
