-- OUR FIRST MODULE STARTS FROM HERE --

---------------------------
-- SERVICES --
---------------------------
-- EMPTY FOR NOW


---------------------------
-- LIBRARY API --
---------------------------
local Connection = {}
Connection.__index = Connection

function Connection.new(connectionName, connectionTask)
    local self = {
      [connectionName] = connectionTask
    }

    return setmetatable(self, Connection)
end

function Connection:Disconnect(connectionName)
    -- to prevert from using this library's Disconnect function we are gonna use for loop.
    for i, v in pairs(self) do
        if self[i] == connectionName then
            if v then
                v:Disconnect()
                return true
            else
                return false
            end
        end
    end

    --return nil
end

function Connection:ClearConnection(connectionName)
    print('clearing the connection')
    if not self[connectionName] and (self[connectionName] ~= nil) then
        self[connectionName] = nil
    end
end

function Connection:ClearAllConnections()
    for connectionName, _ in pairs(self) do
        if not self[connectionName] and (self[connectionName] ~= nil) then
            self[connectionName] = nil
        end
    end
end

return Connection
