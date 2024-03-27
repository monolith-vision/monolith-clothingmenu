Locales = {
  strings = {}
};

---@param name string
---@param values table?
function Locales:Get(name, values)
  if name:find('.') then
    local key, prop = name:match('([^.]*).(.*)');

    return string.formatValues(self.strings[key][prop], values or {});
  end

  return string.format(self.strings[name], values or {});
end

-- ---@param name string
-- ---@param ... any?
-- function Locales:FirstToUpper(name, ...)
--   return string.firstToUpper(self:Get(name, ...));
-- end

function Locales:Init()
  local file = LoadResourceFile(RESOURCE_NAME, 'locales/' .. Config.Locale .. '.json');

  if file == nil then
    Console.Error('File locales/' .. Config.Locale .. '.json could not be found. Falling back to locales/en.json');

    file = LoadResourceFile(RESOURCE_NAME, 'locales/en.json');
  end

  if file == nil then
    return error('File locales/en.json could not be found. Ensure that either locales/' ..
      Config.Locale .. '.json or locales/en.json exist.');
  end

  local obj, errPos, errMsg = json.decode(file);

  if errPos and errMsg then
    error(errMsg);
  end

  self.strings = obj;
end
