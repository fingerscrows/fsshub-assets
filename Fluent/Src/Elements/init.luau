--!optimize 2
local Elements = {}

-- Cache children reference to avoid repeated GetChildren calls
local script_children = script:GetChildren()

-- Numeric loop is faster than iterator for arrays
for i = 1, #script_children do
	Elements[i] = require(script_children[i])
end

return Elements
