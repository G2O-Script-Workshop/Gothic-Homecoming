local activeHorizonalScrollBar = null
local activeVerticalScrollBar = null

local activeScrollBarButton = null
local activeScrollBarButtonDirection = 0
local scrollBarNextTick = getTickCount()

local activeScrollBarClickPosition = null

class GUI.ScrollBar extends GUI.Range
{
#public:
	decreaseButton = null
	increaseButton = null

	constructor(x, y, width, height, file, sliderFile, decreaseButtonFile, increaseButtonFile, orientation = Orientation.Horizontal, window = null)
	{
		if (orientation == Orientation.Horizontal)
		{
			local buttonSize = anx(SCROLLBAR_BUTTON_SIZE)

			decreaseButton = GUI.Button(x, y, buttonSize, height, decreaseButtonFile)
			increaseButton = GUI.Button(x + width - buttonSize, y, buttonSize, height, increaseButtonFile)

			x += buttonSize
			width -= buttonSize * 2
		}
		else if (orientation == Orientation.Vertical)
		{
			local buttonSize = any(SCROLLBAR_BUTTON_SIZE)

			decreaseButton = GUI.Button(x, y, width, buttonSize, decreaseButtonFile)
			increaseButton = GUI.Button(x, y + height - buttonSize, width, buttonSize, increaseButtonFile)

			y += buttonSize
			height -= buttonSize * 2
		}

		decreaseButton.parent = this
		increaseButton.parent = this

		base.constructor(x, y, width, height, file, sliderFile, orientation, window)
	}

	function destroy()
	{
		if (activeHorizonalScrollBar == this)
			activeHorizonalScrollBar = null
		else if (activeVerticalScrollBar == this)
			activeVerticalScrollBar = null

		if (activeScrollBarButton == decreaseButton || activeScrollBarButton == increaseButton)
			activeScrollBarButton = null

		increaseButton = increaseButton.destroy()
		decreaseButton = decreaseButton.destroy()
		base.destroy()
	}

	function changeSection(cursorPositionX, cursorPositionY)
	{
		local isHorizontal = (m_orientation == Orientation.Horizontal)

		local position = getPositionPx()
		local cursorDistance = (isHorizontal) ? cursorPositionY - position.y : cursorPositionX - position.x

		if (cursorDistance < 0)
			cursorDistance = -cursorDistance

		if (cursorDistance <= SCROLLBAR_DRAG_DISTANCE)
			base.changeSection(cursorPositionX, cursorPositionY)
		else
		{
			if (isHorizontal)
				base.changeSection(activeScrollBarClickPosition, cursorPositionY)
			else
				base.changeSection(cursorPositionX, activeScrollBarClickPosition)
		}
	}

	function setAlpha(alpha)
	{
		increaseButton.setAlpha(alpha)
		decreaseButton.setAlpha(alpha)
		base.setAlpha(alpha)
	}

	function top()
	{
		increaseButton.top()
		decreaseButton.top()
		base.top()
	}

	function getActive()
	{
		if (m_orientation == Orientation.Horizontal)
			return this == activeHorizonalScrollBar
		else if (m_orientation == Orientation.Vertical)
			return this == activeVerticalScrollBar
	}

	function setActive()
	{
		if (m_orientation == Orientation.Horizontal)
			activeHorizonalScrollBar = this
		else if (m_orientation == Orientation.Vertical)
			activeVerticalScrollBar = this
	}

	function setVisible(visible)
	{
		base.setVisible(visible)

		decreaseButton.setVisible(visible)
		increaseButton.setVisible(visible)

		if (visible)
		{
			if (!activeHorizonalScrollBar && m_orientation == Orientation.Horizontal)
				activeHorizonalScrollBar = this
			else if (!activeVerticalScrollBar && m_orientation == Orientation.Vertical)
				activeVerticalScrollBar = this
		}
		else
		{
			if (activeHorizonalScrollBar == this)
				activeHorizonalScrollBar = null
			else if (activeVerticalScrollBar == this)
				activeVerticalScrollBar = null
		}
	}

	function getPositionPx()
	{
		return decreaseButton.getPositionPx()
	}

	function getPosition()
	{
		return decreaseButton.getPosition()
	}

	function setPositionPx(x, y)
	{
		local buttonSize = decreaseButton.getSizePx()
		local size = base.getSizePx()

		if (m_orientation == Orientation.Horizontal)
		{
			decreaseButton.setPositionPx(x, y)
			increaseButton.setPositionPx(x + size.width + buttonSize.width, y)

			base.setPositionPx(x + buttonSize.width, y)
		}
		else if (m_orientation == Orientation.Vertical)
		{
			decreaseButton.setPositionPx(x, y)
			increaseButton.setPositionPx(x, y + size.height + buttonSize.height)

			base.setPositionPx(x, y + buttonSize.height)
		}
	}

	function setPosition(x, y)
	{
		setPositionPx(nax(x), nay(y))
	}

	function getSizePx()
	{
		local size = base.getSizePx()
		local buttonSize = decreaseButton.getSizePx()

		if (m_orientation == Orientation.Horizontal)
			size.width += buttonSize.width * 2
		else if (m_orientation == Orientation.Vertical)
			size.height += buttonSize.height * 2

		return size
	}

	function getSize()
	{
		local sizePx = getSizePx()
		return {width = anx(sizePx.width), height = any(sizePx.height)}
	}

	function setSizePx(width, height)
	{
		local position = getPositionPx()
		local buttonSize = decreaseButton.getSizePx()

		if (m_orientation == Orientation.Horizontal)
			increaseButton.setPositionPx(position.x + width + buttonSize.width, position.y)
		else if (m_orientation == Orientation.Vertical)
			increaseButton.setPositionPx(position.x, position.y + height + buttonSize.height)

		base.setSizePx(width, height)
	}

	function setSize(width, height)
	{
		setSizePx(nax(width), nay(height))
	}

	static function onMouseDown(self, btn)
	{
		if (btn != MOUSE_LMB)
			return

		local activeElement = GUI.Range.getActiveElement()

		if (activeElement && activeScrollBarClickPosition == null)
		{
			local cursorPosition = getCursorPositionPx()
			local isHorizontal = (activeElement.m_orientation == Orientation.Horizontal)

			if (activeScrollBarClickPosition == null)
				activeScrollBarClickPosition = (isHorizontal) ? cursorPosition.x : cursorPosition.y
		}

		if (!(self.parent instanceof GUI.ScrollBar))
			return

		local scrollBar = self.parent

		if (self == scrollBar.decreaseButton)
		{
			activeScrollBarButton = scrollBar.decreaseButton
			activeScrollBarButtonDirection = -1
			scrollBarNextTick = getTickCount()
		}
		else if (self == scrollBar.increaseButton)
		{
			activeScrollBarButton = scrollBar.increaseButton
			activeScrollBarButtonDirection = 1
			scrollBarNextTick = getTickCount()
		}
	}

	static function onMouseRelease(btn)
	{
		if (btn != MOUSE_LMB)
			return

		activeScrollBarButton = null
		activeScrollBarClickPosition = null
	}

	static function onRender()
	{
		if (!activeScrollBarButton)
			return

		local now = getTickCount()

		if (scrollBarNextTick > now)
			return

		scrollBarNextTick = scrollBarNextTick + 100

		if (!activeScrollBarButton.isMouseAt())
			return

		local scrollBar = activeScrollBarButton.parent
		scrollBar.setValue(scrollBar.getValue() + activeScrollBarButtonDirection * scrollBar.m_step)
	}


	static function onKey(key)
	{
		local horizontalKey = 0
		local verticalKey = 0

		switch (key)
		{
			case KEY_LEFT:
				horizontalKey = -1
				break

			case KEY_RIGHT:
				horizontalKey = 1
				break

			case KEY_UP:
				verticalKey = -1
				break

			case KEY_DOWN:
				verticalKey = 1
				break
		}

		if (horizontalKey)
		{
			if (!activeHorizonalScrollBar || activeHorizonalScrollBar.getDisabled())
				return

			activeHorizonalScrollBar.setValue(activeHorizonalScrollBar.getValue() + activeHorizonalScrollBar.m_step * horizontalKey)
		}
		else if (verticalKey)
		{
			if (!activeVerticalScrollBar || activeVerticalScrollBar.getDisabled())
				return

			activeVerticalScrollBar.setValue(activeVerticalScrollBar.getValue() + activeVerticalScrollBar.m_step * verticalKey)
		}
	}

	static function onMouseWheel(direction)
	{
		if (!activeVerticalScrollBar || activeVerticalScrollBar.getDisabled())
			return

		activeVerticalScrollBar.setValue(activeVerticalScrollBar.getValue() - direction * activeVerticalScrollBar.m_step)
	}
}
addEventHandler("GUI.onMouseDown", GUI.ScrollBar.onMouseDown)
addEventHandler("onMouseRelease", GUI.ScrollBar.onMouseRelease)
addEventHandler("onRender", GUI.ScrollBar.onRender)
addEventHandler("GUI.onMouseDown", GUI.ScrollBar.onMouseDown)
addEventHandler("onKey", GUI.ScrollBar.onKey)
addEventHandler("onMouseWheel", GUI.ScrollBar.onMouseWheel)
