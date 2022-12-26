local setup, zenmode = pcall(require, "zen-mode")
if not setup then
	return
end

zenmode.setup({
	window = {
		width = 120,
	},

	plugins = {
		twilight = { enabled = true },
	},
})
