class GUI.Draw extends GUI.Base
{
#private:
	m_positionPx = null
	m_sizePx = null
	m_letterSpacingPx = 0
	m_lineSizePx = null

	m_text = ""
	m_font = "FONT_OLD_10_WHITE_HI.TGA"

	m_color = null
	m_alpha = 255

#public:
	letters = null

	constructor(x, y, text, window = null)
	{
		base.constructor()

		letters = []
		m_color = {r = 255, g = 255, b = 255}

		m_positionPx = {x = nax(x), y = nay(y)}
		m_sizePx = {width = 0, height = 0}

		setText(text)

		if (window)
			window.insert(this)
	}

	function leftPx(x, y, width, height)
	{
		local size = getSizePx()

		if (!size.width && !size.height)
			return

		centerPx(x, y, width, height)

		local position = getPositionPx()
		setPositionPx(x, position.y)
	}

	function left(x, y)
	{
		leftPx(nax(x), nay(y))
	}

	function centerPx(x, y, width, height)
	{
		local size = getSizePx()

		if (!size.width && !size.height)
			return

		local centerX = x + (width - size.width) / 2
		local centerY = y + (height - size.height) / 2

		if (centerX > 0)
			m_positionPx.x = centerX

		if (centerY > 0)
			m_positionPx.y = centerY

		setPositionPx(centerX, centerY)
	}

	function center(x, y, width, height)
	{
		centerPx(nax(x), nay(y), nax(width), nay(height))
	}

	function rightPx(x, y, width, height)
	{
		local size = getSizePx()

		if (!size.width && !size.height)
			return

		centerPx(x, y, width, height)
		local position = getPositionPx()

		local rightX = x + (width - size.width)
		setPositionPx(rightX, position.y)
	}

	function right(x, y, width, height)
	{
		rightPx(nax(x), nay(y), nax(width), nay(height))
	}

	function setVisible(visible)
	{
		base.setVisible(visible)

		foreach (letter in letters)
			letter.visible = visible
	}

	function getPositionPx()
	{
		return m_positionPx
	}

	function setPositionPx(x, y, beginLetter = 0, endLetter = -1)
	{
		if (endLetter == -1)
		{
			m_positionPx.x = x
			m_positionPx.y = y

			endLetter = letters.len() - 1
		}

		m_sizePx.width = 0
		local width = 0, height = 0

		for (local i = beginLetter; i <= endLetter; ++i)
		{
			letters[i].setPositionPx(x + width, y + height)
			width += letters[i].widthPx + m_letterSpacingPx

			if (letters[i].text == "\n")
			{
				if (width > m_sizePx.width)
					m_sizePx.width = width

				width = 0
				height += getLineSizePx()
			}
		}

		if (width > m_sizePx.width)
			m_sizePx.width = width

		m_sizePx.height = height + getLineSizePx()
	}

	function getPosition()
	{
		return {x = anx(m_positionPx.x), y = any(m_positionPx.y)}
	}

	function setPosition(x, y, beginLetter = 0, endLetter = -1)
	{
		setPositionPx(nax(x), nay(y), beginLetter, endLetter)
	}

	function getSizePx()
	{
		return m_sizePx
	}

	function getSize()
	{
		return {width = anx(m_sizePx.width), height = any(m_sizePx.height)}
	}

	function getLineSizePx()
	{
		if (m_lineSizePx)
			return m_lineSizePx

		textSetFont(m_font)
		return textHeightPx("")
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

	function getLinesCount()
	{
		return getSizePx().height / getLineSizePx()
	}

	function getLetterSpacingPx()
	{
		return m_letterSpacingPx
	}

	function setLetterSpacingPx(spacing)
	{
		m_letterSpacingPx = spacing
		setPositionPx(m_positionPx.x, m_positionPx.y)
	}

	function getLetterSpacing()
	{
		return nax(m_letterSpacingPx)
	}

	function setLetterSpacing(spacing)
	{
		setLetterSpacingPx(nax(spacing))
	}

	function resize(size)
	{
		if (DRAW_SHRINK_TO_FIT)
			return

		local lettersLen = letters.len()

		for (local i = lettersLen; i < size; ++i)
		{
			letters.push( Draw(anx(0), any(0), "") )

			letters[i].setColor(m_color.r, m_color.g, m_color.b)
			letters[i].setAlpha(m_alpha)
		}

		if (lettersLen > size)
		{
			for (local i = lettersLen; i >= size; --i)
				letters.pop()

			setText(m_text.slice(0, size))
		}
	}

	function top()
	{
		base.top()

		foreach (letter in letters)
			letter.top()
	}

	function parseColor(text)
	{
		local regex = regexp(@"\[#[0-9_a-f_A-F]{6,}]")

		local currentPosition = 0

		local outputString = ""
		local colorInfo = []

		local result

		while (result = regex.search(text, currentPosition))
		{
			local substring = text.slice(currentPosition, result.begin)
			local color = text.slice(result.begin + 2, result.end - 1)

			colorInfo.push({begin = result.begin - colorInfo.len() * 9, color = hexToRgb(color)})

			outputString += substring
			currentPosition = result.end
		}

		outputString += text.slice(currentPosition, text.len())
		m_text = outputString

		if (colorInfo.len() && colorInfo[0].begin > 0)
			colorInfo.insert(0, {begin = 0, color = m_color})

		return {colorInfo = colorInfo, outputString = outputString}
	}

	function getText()
	{
		return m_text
	}

	function setText(text, colorParserEnabled = true)
	{
		if (typeof text != "string")
			text = text.tostring()

		local currentColorIndex = null
		local colorInfo

		if (colorParserEnabled)
		{
			local result = parseColor(text)

			colorInfo = result.colorInfo
			text = result.outputString

			currentColorIndex = 0
		}

		m_text = text

		local textLen = text.len()

		for (local i = 0; i < textLen; ++i)
		{
			local letter = text.slice(i, i + 1)

			if (!(i in letters))
			{
				letters.push( Draw(anx(0), any(0), "") )

				letters[i].setColor(m_color.r, m_color.g, m_color.b)
				letters[i].setAlpha(m_alpha)
			}

			if (colorParserEnabled && colorInfo.len())
			{
				if (currentColorIndex + 1 in colorInfo && i == colorInfo[currentColorIndex + 1].begin)
					currentColorIndex += 1

				letters[i].setColor(colorInfo[currentColorIndex].color.r, colorInfo[currentColorIndex].color.g, colorInfo[currentColorIndex].color.b)
			}

			letters[i].font = m_font
			letters[i].text = letter
			letters[i].visible = m_visible
		}

		for (local j = letters.len() - 1; j >= textLen; --j)
		{
			if (DRAW_SHRINK_TO_FIT)
				letters.pop()
			else
				letters[j].text = ""
		}

		setPositionPx(m_positionPx.x, m_positionPx.y)
	}

	function getFont()
	{
		return m_font
	}

	function setFont(font)
	{
		if (font == m_font)
			return

		m_font = font

		setText(getText())
	}

	function getColor()
	{
		return m_color
	}

	function setColor(r, g, b, beginLetter = 0, endLetter = -1)
	{
		if (endLetter == -1)
		{
			m_color.r = r
			m_color.g = g
			m_color.b = b

			endLetter = letters.len() - 1
		}

		for (local i = beginLetter; i <= endLetter; ++i)
			letters[i].setColor(r, g, b)
	}

	function getAlpha()
	{
		return m_alpha
	}

	function setAlpha(alpha, beginLetter = 0, endLetter = -1)
	{
		if (endLetter == -1)
		{
			m_alpha = alpha

			endLetter = letters.len() -1
		}

		for (local i = beginLetter; i <= endLetter; ++i)
			letters[i].setAlpha(alpha)
	}
}
