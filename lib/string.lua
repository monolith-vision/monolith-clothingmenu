---@param str string
---@param values table
---@return string
function string.formatValues(str, values)
  for key, value in next, values do
    str = str:gsub('{{' .. key .. '}}', function(match)
      return value or match;
    end);
  end

  return str;
end
