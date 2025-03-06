# QR-Notify


![1](https://i.ibb.co/LX3fwPsJ/sd23.png)



QR-Notify is a custom notification system for FiveM, specifically for the QBcore framework. This system replaces the boring default notifications with a more dynamic and customizable notification experience.

## Features
- Custom notification style for QBcore.
- Easy to integrate and use.
- Fully customizable notification types, lengths, and icons.
- Notifications that can appear in various positions on the screen.

## Installation Guide

Follow these steps to install QR-Notify into your QBcore-based server:

1. **Download and Extract:**
   - Drag and drop the `qr-notify` folder into your server's resource directory.

2. **Update the `QBCore.Functions.Notify` function:**
   - Go to the file `qb-core\client\functions.lua`.
   - Search for the function `QBCore.Functions.Notify`.
   - Replace the entire function with the following:

   ```lua
   function QBCore.Functions.Notify(text, texttype, length, icon)
       -- Handle default values and message structure
       local message = {
           action = 'notify',
           type = texttype or 'primary',  -- Default to 'primary' type
           length = length or 5000,       -- Default to 5000 ms (5 seconds)
           text = text,
           icon = icon
       }

       -- If the input is a table, handle it properly
       if type(text) == 'table' then
           message.text = text.text or 'Placeholder'
           message.caption = text.caption or 'Placeholder'
       else
           message.text = text
       end

       -- Send the notification via 'qr-notify' custom system
       TriggerEvent('qr-notify:client:SendNotify', {
           text = message.text,
           type = message.type,
           time = message.length,
           icon = message.icon,
           position = "top-right"  -- You can change this if needed (e.g., top-left, bottom-right)
       })
   end
