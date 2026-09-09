local function diagnostic_jump(direction, severity)
	return function()
		vim.diagnostic.jump({
			count = direction * vim.v.count1,
			severity = severity,
		})
	end
end

local severity = vim.diagnostic.severity

vim.keymap.set("n", "]d", diagnostic_jump(1), {
	desc = "Next Diagnostic",
})

vim.keymap.set("n", "[d", diagnostic_jump(-1), {
	desc = "Previous Diagnostic",
})

vim.keymap.set("n", "]e", diagnostic_jump(1, severity.ERROR), {
	desc = "Next Error",
})

vim.keymap.set("n", "[e", diagnostic_jump(-1, severity.ERROR), {
	desc = "Previous Error",
})

vim.keymap.set("n", "]w", diagnostic_jump(1, severity.WARN), {
	desc = "Next Warning",
})

vim.keymap.set("n", "[w", diagnostic_jump(-1, severity.WARN), {
	desc = "Previous Warning",
})
