--
-- lua-Spore : <http://fperrad.github.com/lua-Spore/>
--

local type = type
local raises = require 'Spore'.raises
local xml = require 'Spore.XML'

_ENV = nil
local m = {}

function m:call (req)
    local spore = req.env.spore
    if spore.payload and type(spore.payload) == 'table' then
        spore.payload = xml.dump(spore.payload, self)
        req.headers['content-type'] = 'text/xml'
    end
    req.headers['accept'] = 'text/xml'
    return  function (res)
                if type(res.body) == 'string' and res.body:match'%S' then
                    local r, msg = xml.parse(res.body, self)
                    if r then
                        res.body = r
                    else
                        if spore.errors then
                            spore.errors:write(msg, "\n")
                            spore.errors:write(res.body, "\n")
                        end
                        if res.status == 200 then
                            raises(res, msg)
                        end
                    end
                end
                return res
            end
end

return m
--
-- Copyright (c) 2010-2012 Francois Perrad
--
-- This library is licensed under the terms of the MIT/X11 license,
-- like Lua itself.
--
