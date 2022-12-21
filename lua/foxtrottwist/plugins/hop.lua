local setup, hop = pcall(require, "hop")
if not setup then
	return
end

-- configure/enable hop
hop.setup()
