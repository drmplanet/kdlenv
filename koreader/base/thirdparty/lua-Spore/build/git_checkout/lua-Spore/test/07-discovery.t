#!/usr/bin/env lua

require 'Test.More'
local decode = require 'json'.decode

plan(12)

local m = require 'Spore.GoogleDiscovery'
type_ok( m, 'table', "Spore.GoogleDiscovery" )
is( m, package.loaded['Spore.GoogleDiscovery'] )

type_ok( m.new_from_discovery, 'function' )
type_ok( m.convert, 'function' )

local gdoc = decode [[
{
  "title": "api",
  "version": "v1",
  "description": "api for unit test",
  "basePath": "/restapi/",
  "documentationLink": "http://developers.google.com/discovery",
  "resources": {
    "test": {
      "methods": {
        "get": {
          "id": "foo.get_info",
          "path": "/show",
          "httpMethod": "GET",
          "parameters": {
            "user": {},
            "border": {}
          }
        }
      }
    }
  }
}
]]

local spec = m.convert(gdoc)
is( spec.name, 'api' )
is( spec.version, 'v1' )
is( spec.description, 'api for unit test' )
is( spec.base_url, 'https://www.googleapis.com/restapi/' )
is( spec.meta.documentation, 'http://developers.google.com/discovery' )
local meth = spec.methods.get_info
type_ok( meth, 'table' )
is( meth.path, '/show' )
is( meth.method, 'GET' )
