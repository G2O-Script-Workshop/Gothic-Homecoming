///////////////
//	Functions
///////////////

/*
	getResolutionChangedScale
*/

local oldResolution = getResolution()
local newResolution = getResolution()

addEventHandler("onChangeResolution", function()
{
	oldResolution = newResolution
	newResolution = getResolution()
})

function getResolutionChangedScale()
{
	local result =
	{
		x = newResolution.x.tofloat() / oldResolution.x.tofloat(),
		y = newResolution.y.tofloat() / oldResolution.y.tofloat()
	}

	return result
}

/*
	getFrameTime
*/

local before = getTickCount()

addEventHandler("onInit", function()
{
	addEventHandler("onRender", function()
	{
		before = getTickCount()
	})
})

function getFrameTime()
{
	return getTickCount() - before
}

function getFrameTimeF()
{
	return getFrameTime() / 1000.0
}

/*
	textHeight
*/

local draw = Draw(0, 0, "")
draw.font = "FONT_OLD_10_WHITE_HI.TGA"

local _textSetFont = textSetFont

function textSetFont(font)
{
	draw.font = font
	_textSetFont(font)
}

function textHeightPx(text)
{
	draw.text = text

	local result = draw.heightPx
	draw.text = ""

	return result
}

function textHeight(text)
{
	return nay(textHeightPx(text))
}

///////////////
//	Events
///////////////

/*
	onMouseMove event
*/

addEvent("onMouseMove")

local oldCursorPosition = getCursorPositionPx()

addEventHandler("onRender", function()
{
	if (!isCursorVisible())
		return

	local cursorPosition = getCursorPositionPx()

	if (cursorPosition.x == oldCursorPosition.x && cursorPosition.y == oldCursorPosition.y)
		return

	callEvent("onMouseMove", cursorPosition.x, cursorPosition.y, oldCursorPosition.x, oldCursorPosition.y)

	oldCursorPosition.x = cursorPosition.x
	oldCursorPosition.y = cursorPosition.y
})
