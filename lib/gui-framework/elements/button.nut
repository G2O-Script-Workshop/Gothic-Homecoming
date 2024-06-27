class GUI.Button extends classes(GUI.Texture, GUI.Alignment, GUI.Offset)
{
#public:
	draw = null

	constructor(x, y, width, height, file, text = null, window = null)
	{
		base.constructor(x, y, width, height, file, window)

		if (text != null)
		{
			draw = GUI.Draw(0, 0, text)
			draw.setDisabled(true)

			GUI.Offset.constructor.call(this)
			setAlignment(Align.Center)
		}
	}

	function destroy()
	{
		if (draw)
			draw = draw.destroy()

		base.destroy()
	}

	function setOffsetPx(x, y)
	{
		GUI.Offset.setOffsetPx.call(this, x, y)
		setAlignment(getAlignment())
	}

	function setOffset(x, y)
	{
		setOffsetPx(nax(x), nay(y))
	}

	function setAlignment(alignment)
	{
		GUI.Alignment.setAlignment.call(this, alignment)

		local position = getPositionPx()
		local size = getSizePx()

		switch (alignment)
		{
			case Align.Left:
				draw.leftPx(position.x + m_offsetPx.x, position.y + m_offsetPx.y, size.width, size.height)
				break

			case Align.Center:
				draw.centerPx(position.x + m_offsetPx.x, position.y + m_offsetPx.y, size.width, size.height)
				break

			case Align.Right:
				draw.rightPx(position.x + m_offsetPx.x, position.y + m_offsetPx.y, size.width, size.height)
				break
		}
	}

	function setVisible(visible)
	{
		base.setVisible(visible)

		if (draw)
			draw.setVisible(visible)
	}

	function setAlpha(alpha)
	{
		base.setAlpha(alpha)

		if (draw)
			draw.setAlpha(alpha)
	}

	function top()
	{
		base.top()

		if (draw)
			draw.top()
	}

	function setPositionPx(x, y)
	{
		base.setPositionPx(x, y)

		if (draw)
			setAlignment(getAlignment())
	}

	function setPosition(x, y)
	{
		setPositionPx(nax(x), nay(y))
	}

	function setSizePx(width, height)
	{
		base.setSizePx(width, height)

		if (draw)
			setAlignment(getAlignment())
	}

	function setSize(x, y)
	{
		setSizePx(nax(x), nay(y))
	}

	function getText()
	{
		return draw.getText()
	}

	function setText(text)
	{
		draw.setText(text)
		setAlignment(getAlignment())
	}
}
