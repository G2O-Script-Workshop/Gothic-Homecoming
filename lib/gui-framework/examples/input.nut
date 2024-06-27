local window = GUI.Window(anx(100), any(100), anx(400), any(400), "MENU_INGAME.TGA", null, true)
local textInput = GUI.Input(anx(100), any(10), anx(300), any(50), "DLG_CONVERSATION.TGA", "FONT_OLD_20_WHITE_HI.TGA", Input.Text, Align.Left, "Text", 6, window)
textInput.selector = "|"
local passwordInput = GUI.Input(anx(100), any(400), anx(300), any(50), "DLG_CONVERSATION.TGA", "FONT_OLD_20_WHITE_HI.TGA", Input.Password, Align.Center, "Password", 2)
local numbersInput = GUI.Input(anx(100), any(500), anx(300), any(50), "DLG_CONVERSATION.TGA", "FONT_OLD_20_WHITE_HI.TGA", Input.Numbers, Align.Right, "Number", 2)
numbersInput.setText("GRACZ_")

addEventHandler("onInit",function()
{
    setCursorVisible(true)

	window.setVisible(true)
    passwordInput.setDisabled(false);
	passwordInput.setVisible(true)
    numbersInput.setDisabled(false);
	numbersInput.setVisible(true)
})

addEventHandler("GUI.onInputInsertLetter", function(element, text)
{
    if(element == textInput)
        print(text)
})

addEventHandler("GUI.onInputRemoveLetter", function(element, letter)
{
    if(element == textInput)
        print(letter)
})

addEventHandler("GUI.onInputActive", function(element)
{
    if(element == textInput)
        print("Aktywowano")
})

addEventHandler("GUI.onInputDeactive", function(element)
{
    if(element == textInput)
        print("Dezaktywowano")
})

/*
GUI.Input(x, y, w, h, file, font, type, align = Align.Left, placeholder = "", margin = 2, node = null)
GUI.Input.setVisible(bool)
GUI.Input.setPosition(x, y)
GUI.Input.setPositionPx(x, y)
GUI.Input.setDisabled(disable)//applies to events
GUI.Input.setActivity(status)
GUI.Input.setColor(r, g, b)
GUI.Input.setAlpha(alpha)
GUI.Input.isFocused()//return bool
GUI.Input.getAlpha()//return int
GUI.Input.getColor() //{r, g, b}
GUI.Input.getPosition()//{x, y}
GUI.Input.getPositionPx()//{x, y}
GUI.Input.getVisible()//return bool
GUI.Input.selector = "|"
GUI.Input.maxLetters = 999
GUI.Input.setText(string text)
GUI.Input.getText()

//events
GUI.onInputInsertLetter(input, letter)
GUI.onInputRemoveLetter(input, letter)
GUI.onInputActive(input)
GUI.onInputDeactive(input)
*/