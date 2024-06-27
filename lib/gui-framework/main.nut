GUI <- {}

enum Orientation
{
	Horizontal,
	Vertical
}

enum Align
{
    Center,
    Left,
    Right
}

const DRAW_SHRINK_TO_FIT = false

const TOOLTIP_INTERVAL = 500

const RANGE_INDICATOR_SIZE = 25

const SCROLLBAR_BUTTON_SIZE = 25
const SCROLLBAR_DRAG_DISTANCE = 135

const TAB_WIDTH = 100
const TAB_HEIGHT = 33

const GRIDLIST_SCROLLBAR_SIZE = 20

//Global Events
addEvent("GUI.onRender")
addEvent("GUI.onClick")
addEvent("GUI.onOpen")
addEvent("GUI.onClose")

//Main init func
addEventHandler("onInit",function()
{
	enableEvent_Render(true)

	//Information about the authors
	print("## Gui Engine 2.0 successfully loaded ##")
	print("- Author Tommy & Patrix")
})
