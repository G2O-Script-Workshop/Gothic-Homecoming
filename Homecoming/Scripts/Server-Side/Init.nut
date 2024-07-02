/* local i18n = Bi18n("en", animLocalization)
Bi18n_setupGlobal(i18n)

addEventHandler("Bi18n:onLocaleChanged", function (locale) {
	print("Locale changed to: " + locale)
})

local t = _t("T_STAND_2_PEE")

print(_t("T_STAND_2_PEE"))
print(_f("Animation name is %s", t))


i18n.setLocale("pl")

print(_t("T_STAND_2_PEE"))
print(_f("Animation name is %s", t))
 */

addEventHandler("onInit", function(){
	print(file(".git/refs/heads/main", "r").read(7))
})