local multidraw = GUI.MultiDraw(0, 0)
multidraw.addLine("This line is red")
multidraw.addLine("This line is green")
multidraw.addLine("This line is blue")

multidraw.addLine("This line is white", 0)

multidraw.setFont("FONT_OLD_20_WHITE_HI.TGA")

multidraw.setColor(255, 0, 0, 1, 1)
multidraw.setColor(0, 255, 0, 2, 2)
multidraw.setColor(0, 0, 255, 3, 3)

multidraw.setAlpha(200)
multidraw.setAlpha(155, 1, 3)

addEventHandler("onInit", function()
{
	multidraw.setVisible(true)
})
