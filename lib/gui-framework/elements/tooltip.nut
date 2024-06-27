local activeToolTip = null
local toolTipInterval = -1

class GUI.ToolTip extends GUI.Button
{
#private:
	m_toolTip = null
	m_paddingPx = null

#public:
	draw = null

	constructor(width, height, file, text = null)
	{
		m_toolTip = {}

		base.constructor(0, 0, width, height, file, text)
		base.setDisabled(true)

		if (text)
		{
			m_paddingPx = {x = nax(width) * 2, y = nay(height) * 2}

			local size = draw.getSize()
			setSize(size.width + width, size.height + height)
		}
	}

	function getToolTip(object)
	{
		if (!(object in m_toolTip))
			return null

		return m_toolTip[object]
	}

	function setToolTip(object, text)
	{
		object.toolTip = this
		m_toolTip[object] <- text
	}

	function getPaddingPx()
	{
		return m_paddingPx
	}

	function setPaddingPx(x, y)
	{
		m_paddingPx.x = x
		m_paddingPx.y = y

		local drawSize = draw.getSizePx()
		setSizePx(drawSize.width + m_paddingPx.x * 2, drawSize.height + m_paddingPx.y * 2)
	}

	function getPadding()
	{
		return {x = anx(m_paddingPx.x), y = any(m_paddingPx.y)}
	}

	function setPadding(x, y)
	{
		setPaddingPx(nax(x), nay(y))
	}

	function setText(text)
	{
		base.setText(text)
		setPaddingPx(m_paddingPx.x, m_paddingPx.y)
	}

	static function onMouseIn(self)
	{
		if (!self.toolTip)
			return

		activeToolTip = self.toolTip

		local toolTip = activeToolTip.getToolTip(self)

		if (toolTip)
			activeToolTip.setText(toolTip)

		toolTipInterval = 0
	}

	static function onMouseOut(self)
	{
		if (!self.toolTip)
			return

		activeToolTip = null
	}

	static function onRender()
	{
		if (!activeToolTip)
			return

		if (toolTipInterval >= TOOLTIP_INTERVAL)
			return

		toolTipInterval += getFrameTime()

		if (toolTipInterval >= TOOLTIP_INTERVAL)
		{
			local cursorPosition = getCursorPositionPx()

			activeToolTip.setPositionPx(cursorPosition.x, cursorPosition.y + 15)
			activeToolTip.top()
			activeToolTip.setVisible(true)
		}
	}

	static function onMouseMove(newCursorX, newCursorY, oldCursorX, oldCursorY)
	{
		if (!activeToolTip)
			return

		activeToolTip.setVisible(false)
		toolTipInterval = 0
	}
}

addEventHandler("GUI.onMouseIn", GUI.ToolTip.onMouseIn)
addEventHandler("GUI.onMouseOut", GUI.ToolTip.onMouseOut)
addEventHandler("onRender", GUI.ToolTip.onRender)
addEventHandler("onMouseMove", GUI.ToolTip.onMouseMove)
