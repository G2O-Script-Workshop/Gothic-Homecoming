enum Input
{
    Text,
    Password,
    Numbers
}

addEvent("GUI.onInputInsertLetter")
addEvent("GUI.onInputRemoveLetter")
addEvent("GUI.onInputActive")
addEvent("GUI.onInputDeactive")

class GUI.Input extends GUI.Texture
{
    static InputsList = []

#private:
    m_distance = null
    m_type = null
    m_align = null
    m_placeholder = ""
    m_margin = 2
    m_text = ""
    m_active = false
#public:
    draw = null
    distance = null
    selector = "|"
    maxLetters = 1000

    constructor(x, y, w, h, file, font, type, align = Align.Left, placeholder = "", margin = 2, window = null)
    {
        draw = GUI.Draw(x, y, placeholder)
        draw.setFont(font)

        m_placeholder = placeholder
        m_align = align
        m_type = type
        m_margin = margin
        m_text = ""
        m_active = false

		  base.constructor(x, y, w, h, file, window)
		  draw.top()

        alignText()
        InputsList.append(this)
    }

    function alignText()
    {
        local pos = base.getPositionPx()
        local size = base.getSizePx()
        local sizeDraw = draw.getSizePx()
        switch(m_align)
        {
            case Align.Left:
                draw.setPositionPx(pos.x + m_margin, pos.y + size.height/2 - sizeDraw.height/2)
                break
            case Align.Center:
                draw.setPositionPx(pos.x + size.width/2 - sizeDraw.width/2, pos.y + size.height/2 - sizeDraw.height/2)
                break
            case Align.Right:
                draw.setPositionPx(pos.x + size.width - (sizeDraw.width + m_margin), pos.y + size.height/2 - sizeDraw.height/2)
                break
        }
    }

    function setVisible(bool)
    {
        base.setVisible(bool)
        draw.setVisible(bool)
    }

    function destroy()
	{
		base.destroy()
		draw.destroy()
	}

    function setPosition(x, y)
    {
        setPositionPx(nax(x), nay(y))
    }

    function setPositionPx(x, y)
    {
        base.setPositionPx(x, y)
        alignText()
    }

    function setAlpha(alpha)
    {
        draw.setAlpha(alpha)
        base.setAlpha(alpha)
    }

    function setText(text)
    {
        m_text = text

        if(!m_active && m_text == "")
        {
            draw.setText(m_placeholder)
            return
        }

        if(m_active)
        {
            if(m_type == Input.Password)
                draw.setText(cutText(hash(m_text) + selector))
            else
                draw.setText(cutText(m_text + selector))
        }
        else
        {
            if(m_type == Input.Password)
                draw.setText(cutText(hash(m_text)))
            else
                draw.setText(cutText(m_text))
        }

        alignText()
    }

    function getText()
    {
        return m_text
    }

    function setDisabled(disable)
    {
        setActivity(false)
        base.setDisabled(disable)
    }

    function setActivity(status)
    {
        enableKeys(!status)

        if(m_active == status)
            return

        m_active = status

        setText(m_text)
    }

    static function cutText(text)
    {
        local size = base.getSizePx()
        local finishText = ""
        textSetFont(draw.getFont())
        for (local i = text.len(); i > 0; i--)
        {
            local char = text.slice(i-1, i);
            if(textWidthPx(finishText + char) < size.width - (2*m_margin))
                finishText = char + finishText
            else
                return finishText
        }
        return finishText
    }

    static function hash(text)
    {
        local endText = ""
        for(local i = 0; i < text.len(); i++)
            endText += "#"

        return endText
    }

    function removeLetter()
    {
        if(m_text.len() < 1)
            return

        if(!base.getDisabled())
            callEvent("GUI.onInputInsertLetter", this, m_text.slice(m_text.len()-1))

        m_text = m_text.slice(0, m_text.len()-1)

        if(m_type == Input.Password)
            draw.setText(cutText(hash(m_text) + selector))
        else
            draw.setText(cutText(m_text + selector))
    }

    function addLetter(key)
    {
        if(m_text.len() > maxLetters)
            return

        local letter = getKeyLetter(key)
        if(!letter)
            return

        if(m_type == Input.Numbers)
        {
            if(letter == "0" || letter == "1" || letter == "2" || letter == "3" || letter == "4"
            || letter == "5" || letter == "6" || letter == "7" || letter == "8" || letter == "9" || letter == "0")
                m_text += letter
        }
        else
            m_text += letter

        if(m_type == Input.Password)
            draw.setText(cutText(hash(m_text)) + selector)
        else
            draw.setText(cutText(m_text  + selector))

        if(!base.getDisabled())
            callEvent("GUI.onInputRemoveLetter", this, letter)
    }

    static function keyHandler(key)
    {
        foreach(obj in GUI.Input.InputsList)
        {
            if(obj.m_active)
            {
                if(key == KEY_BACK)
                    obj.removeLetter()
                else
                    obj.addLetter(key)

                obj.alignText()
            }
        }
    }

    static function clickHandler(btn)
    {
        if(btn == MOUSE_LMB)
        {
            foreach(obj in GUI.Input.InputsList)
            {
                if(!obj.getDisabled())
                {
                    if(obj.isMouseAt())
                    {
                        obj.setActivity(true)
                        callEvent("GUI.onInputActive", obj)
                    }
                    else
                    {
                        if(obj.m_active)
                        {
                            obj.setActivity(false)
                            callEvent("GUI.onInputDeactive", obj)
                        }
                    }

                    obj.alignText()
                }
            }
        }
    }
}

addEventHandler("onKey", GUI.Input.keyHandler)
addEventHandler("onMouseClick", GUI.Input.clickHandler)
