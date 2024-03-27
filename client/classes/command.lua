Command = {
  registered = {}
};

---@param cmd string
---@param cb fun(source: number, args: string[], rawCommand: string)
function Command:Register(cmd, cb)
  if self.registered[cmd] then
    return Console.Error('Command ' .. cmd .. ' is already registered');
  end

  RegisterCommand(cmd, cb, false);

  self.registered[cmd] = true;
end

---@param cmd string
---@param cb fun(source: number, args: string[], rawCommand: string)?
---@param desc string
---@param defaultMapper string
function Command:RegisterInput(cmd, cb, desc, defaultMapper)
  if not self.registered[cmd] then
    if not cb then
      return;
    end

    self:Register(cmd, cb);
  end

  RegisterKeyMapping(cmd, desc, 'keyboard', defaultMapper);
end
