local status, barbar = pcall(require, "bufferline")
if not status then
	return
end

barbar.setup({
	letters = "arstneiogmkhxcdvzlywfpubjq;ARSTNEIGMKHXCDVZLYWFPUBJQ:",
})
