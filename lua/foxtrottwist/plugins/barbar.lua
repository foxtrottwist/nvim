local status, barbar = pcall(require, "bufferline")
if not status then
	return
end

barbar.setup({
	-- Enable/disable animations
	animation = false,
	-- Enable/disable auto-hiding the tab bar when there is a single buffer
	auto_hide = true,
	-- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
	hide = { extensions = true, inactive = true },
	letters = "arstneiogmkhxcdvzlywfpubjq;ARSTNEIGMKHXCDVZLYWFPUBJQ:",
})
