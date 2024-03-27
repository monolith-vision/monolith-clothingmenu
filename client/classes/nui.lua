NUI = {};

---@param action string
---@param data any?
function NUI:TriggerEvent(action, data)
  SendNUIMessage({
    action = action,
    data = data
  });
end

---@param events { action: string, data: any? }
function NUI:TriggerEvents(events)
  for _, event in next, events do
    self:TriggerEvent(event.action, event.data);
  end
end
