-- helpers
-- utility functions for nornsvember

local Helpers = {}

-- example helper function
function Helpers.map(value, in_min, in_max, out_min, out_max)
  return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
end

-- example helper function
function Helpers.clamp(value, min, max)
  return math.min(math.max(value, min), max)
end

return Helpers
