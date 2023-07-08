local bothside = IsDuplicityVersion()

local debug = debug
local debug_getinfo = debug.getinfo

local serverCallbacks = {}
local clientCallbacks = {}

local function checkType(obj, typeof, opt_typeof, errMessage)
	local objtype = type(obj)
	local di = debug_getinfo(2)
	local errMessage = errMessage or (opt_typeof == nil and (di.name .. ' expected %s, but got %s') or (di.name .. ' expected %s or %s, but got %s'))
	if typeof ~= 'function' then
		if objtype ~= typeof and objtype ~= opt_typeof then
			error((errMessage):format(typeof, (opt_typeof == nil and objtype or opt_typeof), objtype))
		end
	else
		if objtype == 'table' and not rawget(obj, '__cfx_functionReference') then
			error((errMessage):format(typeof, (opt_typeof == nil and objtype or opt_typeof), objtype))
		end
	end
end

if bothside then
    ----- SERVER TO CLIENT -----
    _G.TriggerServerCallback = function(args)
        checkType(args, 'table')
        checkType(args.eventName, 'string')
        checkType(args.callback, 'function')

        local eventName = args.eventName
        local clientCallback = args.callback
        local src = source

        RegisterNetEvent('ice_system:client:callback:' .. eventName)
        AddEventHandler('ice_system:client:callback:' .. eventName, function(requestId, ...)
            local source = tonumber(src)
            print(source, requestId)

            clientCallback(...)
        end)

        local requestId = math.random(1000, 9999)
        TriggerClientEvent('ice_system:server:callback:' .. eventName, src, requestId)
    end

    _G.CreateServerCallback = function(args)
        checkType(args, 'table')
        checkType(args.eventName, 'string')
        checkType(args.eventCallback, 'function')

        local eventName = args.eventName
        local eventCallback = args.eventCallback

        serverCallbacks[eventName] = eventCallback

        RegisterNetEvent('ice_system:server:callback:' .. eventName)
        AddEventHandler('ice_system:server:callback:' .. eventName, function(src, requestId, ...)
            local source = tonumber(src)
            print(source, requestId)

            local cb = function(...)
                TriggerClientEvent('ice_system:client:callback:' .. eventName, source, requestId, ...)
            end
            eventCallback(source, cb, ...)
        end)
    end
end

if not bothside then
    ----- CLIENT TO SERVER -----
    _G.TriggerServerCallback = function(args)
        checkType(args, 'table')
        checkType(args.eventName, 'string')
        checkType(args.callback, 'function')

        local eventName = args.eventName
        local clientCallback = args.callback

        local requestId = math.random(1000, 9999)

        RegisterNetEvent('ice_system:client:callback:' .. eventName)
        AddEventHandler('ice_system:client:callback:' .. eventName, function(responseId, ...)
            if responseId == requestId then
                clientCallback(...)
            end
        end)

        TriggerServerEvent('ice_system:server:callback:' .. eventName, GetPlayerServerId(PlayerId()), requestId)
    end
end