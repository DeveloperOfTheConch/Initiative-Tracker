import json

file1 = open("srd_5e_monsters.json",encoding="utf8")
file2 = open("FormattedCreatureData.json","w",encoding="utf8")

data = json.load(file1)

formattedList = []

def HTMLFormat(title,text):
    return "<p><b>"+title+" </b> " + text + "</p>"

for item in data["request"]:
    speed = item["Speed"]
    armorClass = int(item["Armor Class"][:2])
    hp = item["Hit Points"]
    hpDefault = int(hp[:hp.find("(")])
    hpDie = int(hp[hp.find("(")+1:hp.find("d")])
    if "+" in hp.split():
        hpCount = int(hp[hp.find("d")+1:hp.find(" +")])
        hpAdd = int(hp[hp.find("+")+2:hp.find(")")])
    elif "-" in hp.split():
        hpCount = int(hp[hp.find("d")+1:hp.find(" -")])
        hpAdd = int(hp[hp.find("-")+2:hp.find(")")])
    else:
        hpCount = int(hp[hp.find("d")+1:hp.find(")")])
        hpAdd = 0

    STR = int(item["STR"])
    DEX = int(item["DEX"])
    CON = int(item["CON"])
    WIS = int(item["WIS"])
    INT = int(item["INT"])
    CHA = int(item["CHA"])

    stats = ""
    stats=stats+HTMLFormat("Speed",item["Speed"])
    if "Skills" in item:
        ski = item["Skills"]
        stats=stats+HTMLFormat("Skills",ski)
    if "Saving_Throws" in item:
        sav = item["Saving_Throws"]
        stats=stats+HTMLFormat("Saving Throws",sav)
    if "Damage_Resistances" in item:
        res = item["Damage_Resistances"]
        stats=stats+HTMLFormat("Damage Resistances",res)
    if "Damage_Immunities" in item:
        imm = item["Damage_immunities"]
        stats=stats+HTMLFormat("Damage Immunities",imm)
    if "Condition_Immunities" in item:
        con = item["Condition_Immunities"]
        stats=stats+HTMLFormat("Condition Immunities",con)
   
    stats=stats+HTMLFormat("Senses",item["Senses"])
    stats=stats+HTMLFormat("Languages",item["Speed"])
    stats=stats+HTMLFormat("Challenge",item["Speed"])

    text = ""
    if "Traits" in item:
        text=text+item["Traits"]
    if "Actions" in item:
        text=text+"<h1>Actions</h1>"
        text=text+item["Actions"]
    if "Legendary_Actions" in item:
        leg = item["Legendary_Actions"]
        text=text+"<h1>Legendary Actions</h1>"
        text=text+leg


    formattedList.append({"name": item["name"],
                          "type": item["meta"],
                          "speed": item["Speed"],
                          "armorClass": armorClass,
                          "hpDefault": hpDefault,
                          "hpDie": hpDie,
                          "hpCount": hpCount,
                          "hpAdd": hpAdd,
                          "STR": STR,
                          "DEX": DEX,
                          "CON": CON,
                          "WIS": WIS,
                          "INT": INT,
                          "CHA": CHA,
                          "stats": stats,
                          "text": text
                          })
print(formattedList[0])
json_item = json.dumps({"request":formattedList})
file2.write(json_item)
