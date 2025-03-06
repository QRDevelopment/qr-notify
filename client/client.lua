local function ShowNotification(data)
    -- Handle all possible input formats
    local message, nType, duration = '', 'info', 5000

    -- Handle string only input
    if type(data) == 'string' then
        message = data
    -- Handle table input
    elseif type(data) == 'table' then
        -- Handle array-style notifications ([1] = message, [2] = type)
        if data[1] ~= nil then
            message = data[1]
            nType = data[2] or nType
        -- Handle standard table format
        else
            message = data.text or data.message or data.msg or ''
            nType = data.type or nType
            duration = data.time or data.duration or duration
        end
    end

    SendNUIMessage({
        type = "SHOW_NOTIFY",
        data = {
            title = data.title or "",
            message = message,
            type = nType,
            duration = duration,
            position = data.position or "top-right"
        }
    })
end

-- Register callback for other resources
RegisterNetEvent('qr-notify:client:SendNotify', ShowNotification)
