/*
    Gui Framework
    Author: Tommy and Patrix
*/

//animation type
const EFFECT_ALPHA = 1;
const EFFECT_SMOOTH_UP = 2;
const EFFECT_SMOOTH_DOWN = 3;
const EFFECT_SMOOTH_RIGHT = 4;
const EFFECT_SMOOTH_LEFT = 5;

const EFFECT_ALPHA_HIDE = 6;
const EFFECT_SMOOTH_UP_HIDE = 7;
const EFFECT_SMOOTH_DOWN_HIDE = 8;
const EFFECT_SMOOTH_RIGHT_HIDE = 9;
const EFFECT_SMOOTH_LEFT_HIDE = 10;

//events
addEvent("onAnimWindowEnd");

class GUI.Animation
{
    static renderEventList = [];

    constructor(_obj)
    {
        element = _obj;
        time = 0.0;
        type = null;
        isActive = false;
        deltaTime = 0;
        miliSecond = 0;

        renderEventList.append(this);
    }

    function change(_type, _time)
    {
        isActive = false;
        time = _time.tofloat();
        type = _type;
    }

    function play()
    {
        local pos = element.getPosition();
        element.setPosition(pos.x, pos.y, false);

        if(isActive)
            isActive = false;

        switch(type)
        {
            case EFFECT_ALPHA:
                dimensions = {controlPoint = 0};
                break;
            case EFFECT_SMOOTH_UP:
                dimensions = {
                    start = GuiVector2D(pos.x, 0 - element.getSize().height),
                    end = GuiVector2D(pos.x, pos.y),
                    controlPos = GuiVector2D(pos.x, 0 - element.getSize().height)
                };
                break;
            case EFFECT_SMOOTH_DOWN:
                dimensions = {
                    start = GuiVector2D(pos.x, getResolution().y + element.getSize().height),
                    end = GuiVector2D(pos.x, pos.y),
                    controlPos = GuiVector2D(pos.x, getResolution().y + element.getSize().height)
                };
                break;
            case EFFECT_SMOOTH_LEFT:
                dimensions = {
                    start = GuiVector2D(0 - element.getSize().width, pos.y),
                    end = GuiVector2D(pos.x, pos.y),
                    controlPos = GuiVector2D(0 - element.getSize().width, pos.y)
                };
                break;
            case EFFECT_SMOOTH_RIGHT:
                dimensions = {
                    start = GuiVector2D(getResolution().x + element.getSize().width, pos.y),
                    end = GuiVector2D(pos.x, pos.y),
                    controlPos = GuiVector2D(getResolution().x + element.getSize().width, pos.y)
                };
                break;
            case EFFECT_ALPHA_HIDE:
                dimensions = {controlPoint = 255};
                break;
            case EFFECT_SMOOTH_UP_HIDE:
                dimensions = {
                    start = GuiVector2D(pos.x, pos.y),
                    end = GuiVector2D(pos.x, 0 - element.getSize().height),
                    controlPos = GuiVector2D(pos.x, pos.y)
                };
                break;
            case EFFECT_SMOOTH_DOWN_HIDE:
                dimensions = {
                    start = GuiVector2D(pos.x, pos.y),
                    end = GuiVector2D(pos.x, getResolution().y + element.getSize().height),
                    controlPos = GuiVector2D(pos.x, pos.y)
                };
                break;
            case EFFECT_SMOOTH_RIGHT_HIDE:
                dimensions = {
                    start = GuiVector2D(pos.x, pos.y),
                    end = GuiVector2D(getResolution().x + element.getSize().width, pos.y),
                    controlPos = GuiVector2D(pos.x, pos.y)
                };
                break;
            case EFFECT_SMOOTH_LEFT_HIDE:
                dimensions = {
                    start = GuiVector2D(pos.x, pos.y),
                    end = GuiVector2D(getResolution().x - element.getSize().width, pos.y),
                    controlPos = GuiVector2D(pos.x, pos.y)
                };
                break;
        }

        if(type != EFFECT_ALPHA && type != EFFECT_ALPHA_HIDE)
            element.setPosition(dimensions.start.x, dimensions.start.y, false);

        deltaTime = getTickCount();
        miliSecond = 0;
        isActive = true;
    }

    function getShow()//get type (hide/show)
    {
        if(type >= 1 && type <= 5)
            return true;
        else
            return false;
    }

    static function calcSpeed(currPos, endPos)//temporary
    {
        return fabs(currPos - endPos) / time;
    }

    function follow()
    {
        ++miliSecond;

        switch(type)
        {
            case EFFECT_ALPHA:
                local speed = 255.0 / time
                dimensions.controlPoint = dimensions.controlPoint + speed;
                element.setAlpha(dimensions.controlPoint)
                break;
            case EFFECT_ALPHA_HIDE:
                local speed = 255.0 / time
                dimensions.controlPoint = dimensions.controlPoint - speed;
                element.setAlpha(dimensions.controlPoint)
                break;
            case EFFECT_SMOOTH_UP:
            case EFFECT_SMOOTH_DOWN_HIDE:
                dimensions.controlPos.y = dimensions.controlPos.y + calcSpeed(element.parent.getPositionPx().y, dimensions.end.y) * miliSecond;
                break;
            case EFFECT_SMOOTH_DOWN:
            case EFFECT_SMOOTH_UP_HIDE:
                dimensions.controlPos.y = dimensions.controlPos.y - calcSpeed(element.parent.getPositionPx().y, dimensions.end.y) * miliSecond;
                break;
            case EFFECT_SMOOTH_LEFT:
            case EFFECT_SMOOTH_RIGHT_HIDE:
                dimensions.controlPos.x = dimensions.controlPos.x + calcSpeed(element.parent.getPositionPx().x, dimensions.end.x) * miliSecond;
                break;
            case EFFECT_SMOOTH_RIGHT:
            case EFFECT_SMOOTH_LEFT_HIDE:
                dimensions.controlPos.x = dimensions.controlPos.x - calcSpeed(element.parent.getPositionPx().x, dimensions.end.x) * miliSecond;
                break;
        }

        if(type != EFFECT_ALPHA && type != EFFECT_ALPHA_HIDE)
            element.setPosition(dimensions.controlPos.x, dimensions.controlPos.y, false);

        if(miliSecond == time)
        {
            isActive = false;
            callEvent("onAnimWindowEnd", element, type);
        }
    }

    static function renderEvent()
    {
        foreach(object in GUI.Animation.renderEventList)
        {
            if(object.isActive)
            {
                if(object.deltaTime <= getTickCount())
                {
                    object.deltaTime = getTickCount() - object.deltaTime + 1;
                    object.follow();
                }
            }
        }
    }

    element = null;
    time = null;
    type = null;
    dimensions = null;

    isActive = false;

    deltaTime = 0;
    miliSecond = 0;
}

addEventHandler("onRender", GUI.Animation.renderEvent)
