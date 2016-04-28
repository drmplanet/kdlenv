local DrawContext = require("ffi/drawcontext")
local BB = require("ffi/blitbuffer")
local Pic = require("ffi/pic")

Pic.color = true


describe("Pic module", function()
    describe("basic API", function()
        it("should return error on unkonw format", function()
            assert.has_error(function()
                Pic.openDocument("/mnt/yolo.jpgwtffmt")
            end, "Unsupported image format")
        end)
    end)

    describe("PNG support", function()
        local image
        setup(function()
            local SAMPLE_PNG = "spec/base/unit/data/transparency_various_bg.png"
            image = Pic.openDocument(SAMPLE_PNG)
        end)

        it("should load png file", function()
            assert.are_not.equal(image, nil)
        end)
        it("should get image size", function()
            assert.are.same({32, 32, 4}, {image:getOriginalPageSize()})
            local page = image:openPage()
            assert.are_not.equal(page, nil)
            local dc_null = DrawContext.new()
            assert.are.same({32, 32}, {page:getSize(dc_null)})
            page:close()
        end)
        it("should return emtpy table of content", function()
            assert.are.same(image:getToc(), {})
        end)
        it("should return 1 as number of pages", function()
            assert.are.same(image:getPages(), 1)
        end)
        it("should return 0 as cache size", function()
            assert.are.same(image:getCacheSize(), 0)
        end)
        it("should render PNG as inverted BB properly", function()
            local page = image:openPage()
            local dc_null = DrawContext.new()
            local tmp_bb = BB.new(image.width, image.height, BB.TYPE_BBRGB24)
            --@TODO check against digest  15.06 2014 (houqp)
            page:draw(dc_null, tmp_bb)
            tmp_bb:invert()
            local c = tmp_bb:getPixel(0, 0)
            assert.are.same({0x80, 0x80, 0x80}, {c.r, c.g, c.b})
            c = tmp_bb:getPixel(21, 10)
            assert.are.same({0x55, 0xFF, 0x55}, {c.r, c.g, c.b})
            c = tmp_bb:getPixel(12, 15)
            assert.are.same({0xFF, 0xFF, 0xFF}, {c.r, c.g, c.b})
            page:close()
        end)
    end)

    describe("JPG support", function()
        local d
        setup(function()
            local SAMPLE_JPG = "spec/base/unit/data/sample.jpg"
            d = Pic.openDocument(SAMPLE_JPG)
        end)

        it("should load jpg file", function()
            assert.are_not.equal(d, nil)
        end)
        it("should be able to get image size", function()
            assert.are.same({313, 234, 3}, {d:getOriginalPageSize()})
            local page = d:openPage()
            assert.are_not.equal(page, nil)
            local dc_null = DrawContext.new()
            assert.are.same({313, 234}, {page:getSize(dc_null)})
            page:close()
        end)
        it("should return emtpy table of content", function()
            assert.are.same(d:getToc(), {})
        end)
        it("should return 1 as number of pages", function()
            assert.are.same(d:getPages(), 1)
        end)
        it("should return 0 as cache size", function()
            assert.are.same(d:getCacheSize(), 0)
        end)
        it("should render JPG as inverted BB properly", function()
            local page = d:openPage()
            local dc_null = DrawContext.new()
            local tmp_bb = BB.new(d.width, d.height, BB.TYPE_BBRGB24)
            --@TODO check against digest  15.06 2014 (houqp)
            page:draw(dc_null, tmp_bb)
            tmp_bb:invert()
            local c = tmp_bb:getPixel(0, 0)
            assert.are.same({0xB1, 0xA4, 0xC2}, {c.r, c.g, c.b})
            c = tmp_bb:getPixel(1, 0)
            assert.are.same({0xB3, 0xA6, 0xC4}, {c.r, c.g, c.b})
            c = tmp_bb:getPixel(2, 0)
            assert.are.same({0xB7, 0xAA, 0xC8}, {c.r, c.g, c.b})
            page:close()
        end)

        teardown(function()
            d:close()
        end)
    end)
end)
