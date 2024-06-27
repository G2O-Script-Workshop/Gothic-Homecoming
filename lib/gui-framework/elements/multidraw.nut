class GUI.MultiDraw
{
#private:
	m_visible = false

	m_positionPx = null

	m_letterSpacingPx = 0
	m_lineSizePx = null

	m_font = "FONT_OLD_10_WHITE_HI.TGA"

	m_color = null
	m_alpha = 255

#public:
	lines = null

	constructor(x, y)
	{
		lines = []

		m_positionPx = {x = nax(x), y = nay(y)}
		m_color = {r = 255, g = 255, b = 255}
	}

	function destroy()
	{
		foreach (line in lines)
			line.destroy()
	}

	function addLine(text, position = null)
	{
		if (position == null)
			position = lines.len()

		local offset = 0

		if (position > 0)
			offset = lines[0].getLineSize() * position

		local line = GUI.Draw(anx(m_positionPx.x), any(m_positionPx.y) + offset, text)
		line.setFont(m_font)

		lines.insert(position, line)

		if (position != lines.len() - 1)
			setPositionPx(m_positionPx.x, m_positionPx.y)
	}

	function removeLine(position = null)
	{
		if (position == null)
			position = lines.len() - 1

		lines.remove(position)

		setPositionPx(m_positionPx.x, m_positionPx.y)
	}

	function getPositionPx()
	{
		return m_positionPx
	}

	function setPositionPx(x, y)
	{
		m_positionPx.x = x
		m_positionPx.y = y

		foreach (line in lines)
		{
			line.setPositionPx(x, y)
			y += getLineSizePx()
		}
	}

	function getPosition()
	{
		return {x = anx(m_positionPx.x), y = any(m_positionPx.y)}
	}

	function setPosition(x, y)
	{
		setPositionPx(nax(x), nay(y))
	}

	function getSizePx()
	{
		local maxWidth = 0
		local lineHeight = 0

		foreach (line in lines)
		{
			local lineSize = line.getSize()

			if (lineSize.width > maxWidth)
				maxWidth = lineSize.width
		}

		if (0 in lines)
			lineHeight = lines[0].height

		return {width = maxWidth, height = lines.len() * lineHeight}
	}

	function getSize()
	{
		local size = getSizePx()
		return {width = anx(size.width), height = any(size.height)}
	}

	function getLetterSpacingPx()
	{
		return m_letterSpacingPx
	}

	function setLetterSpacingPx(spacing)
	{
		m_letterSpacingPx = spacing

		foreach (line in lines)
			line.setLetterSpacingPx(m_letterSpacingPx)
	}

	function getLetterSpacing()
	{
		return nax(m_letterSpacingPx)
	}

	function setLetterSpacing(spacing)
	{
		setLetterSpacingPx(nax(spacing))
	}

	function getLineSizePx()
	{
		if (m_lineSizePx)
			return m_lineSizePx

		if (0 in lines)
			return lines[0].getLineSizePx()

		return null
	}

	function setLineSizePx(lineSize)
	{
		m_lineSizePx = lineSize
		setPositionPx(m_positionPx.x, m_positionPx.y)
	}

	function getLineSize()
	{
		return any(getLineSizePx())
	}

	function setLineSize(lineSize)
	{
		setLineSizePx(any(lineSize))
	}

	function top()
	{
		foreach (line in lines)
			line.top()
	}

	function getVisible()
	{
		return m_visible
	}

	function setVisible(visible)
	{
		m_visible = visible

		foreach (line in lines)
			line.setVisible(visible)
	}

	function getFont()
	{
		return m_font
	}

	function setFont(font)
	{
		m_font = font

		foreach (line in lines)
			line.setFont(font)

		setPositionPx(m_positionPx.x, m_positionPx.y)
	}

	function getColor()
	{
		return m_color
	}

	function setColor(r, g, b, beginLine = 0, endLine = -1)
	{
		if (endLine == -1)
		{
			m_color.r = r
			m_color.g = g
			m_color.b = b

			endLine = lines.len() - 1
		}

		for (local i = beginLine; i <= endLine; ++i)
			lines[i].setColor(r, g, b)
	}

	function getAlpha()
	{
		return m_alpha
	}

	function setAlpha(alpha, beginLine = 0, endLine = -1)
	{
		if (endLine == -1)
		{
			m_alpha = alpha

			endLine = lines.len() - 1
		}

		for (local i = beginLine; i <= endLine; ++i)
			lines[i].setAlpha(alpha)
	}
}
