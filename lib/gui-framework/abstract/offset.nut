class GUI.Offset
{
#private:
    m_offsetPx = null

#public:
    constructor()
    {
        m_offsetPx =
        {
            x = 0
            y = 0
        }
    }

    function getOffsetPx()
    {
        return m_offsetPx
    }

    function setOffsetPx(x, y)
    {
        m_offsetPx.x = x
        m_offsetPx.y = y
    }

    function getOffset()
    {
        return {x = anx(m_offsetPx.x), y = any(m_offsetPx.y)}
    }

    function setOffset(x, y)
    {
        setOffsetPx(nax(x), nay(y))
    }
}
