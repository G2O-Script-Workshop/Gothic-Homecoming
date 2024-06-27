local window = GUI.Window(anx(100), any(100), anx(400), any(400), "MENU_INGAME.TGA", null, true)
window.setAlpha(200)
window.setColor(255, 0, 0, true)
window.setSizePx(500, 300)
window.setSizePx(500, 300)

addEventHandler("onInit", function()
{
	enableEvent_Render(true)
	window.setVisible(true)
	setCursorVisible(true)
})

addEventHandler("GUI.onOpen", function(element)
{
	if(element == window)
		print("Window was opened")
});

addEventHandler("GUI.onClose", function(element)
{
	if(element == window)
		print("Window was closed")
});


addEventHandler("onKey", function(key)
{
	if(key == KEY_P)
		window.setVisible(!window.getVisible())
});

/*
GUI.Window(x, y, w, h, texture, textureAlign = null, moveEnable = false, animate = false)
GUI.Window.setVisible(bool)
GUI.Window.setPosition(x, y, syncVector = true)
GUI.Window.setPositionPx(x, y, syncVector = true)
GUI.Window.setSizePx(w, h)
GUI.Window.setSize(w, h)
GUI.Window.setTexture(_file)
GUI.Window.setAlpha(_alpha)
GUI.Window.setColor(_r, _g, _b, colorAll = false)
GUI.Window.isVisible()//return bool
GUI.Window.getPositionPx()//return {x, y}
GUI.Window.getPosition()//return {x, y}
GUI.Window.getSizePx()//return {width, height}
GUI.Window.getSize()//return {width, height}
GUI.Window.getTexture()//return string
GUI.Window.getAlpha()//return int
GUI.Window.getColor()//return {r, g, b}

//Global
GUI.Window.hideAll();
GUI.Window.isOpen()//return bool
*/
