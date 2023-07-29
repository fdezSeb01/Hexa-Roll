extends Node
var bestscore =0 setget setBestScore
var totalcoins =0 setget setTotalCoins
var soundonoff = true setget setSoundOnOff
var challengeNumber=0 setget setChallengeNumber
var challengesCompleted=0 setget setChallengesCompleted
const filepath = "user://bestscore.data"
const filepath2 = "user://totalcoins.data"
const filepath3 = "user://SoundOnOff.data"
const filepath4 = "user://challengeNumber.data"
const filepath5 = "user://challengesCompleted.data"

var haveSmile =false setget setHaveSmile 
var haveSad =false setget setHaveSad 
var haveAstro = false setget setHaveAstro
var haveDuck =false setget setHaveDuck
var haveEye =false setget setHaveEye
var haveAngry = false setget setHaveAngry 
var haveFackaf =false setget setHaveFackaf
var haveSpiral =false setget setHaveSpiral
var haveSpiralwow = false setget setHaveSpiralwow
var haveTeddy =false setget setHaveTeddy
var haveTurtle = false setget setHaveTurtle
const filepathSmile = "user://haveSmile.data"
const filepathSad = "user://haveSad.data"
const filepathAstro = "user://haveAstro.data"
const filepathDuck = "user://haveDuck.data"
const filepathEye = "user://haveEye.data"
const filepathAngry = "user://haveAngry.data"
const filepathFackaf = "user://haveFackaf.data"
const filepathSpiral = "user://haveSpiral.data"
const filepathSpiralwow = "user://haveSpiralwow.data"
const filepathTeddy = "user://haveTeddy.data"
const filepathTurtle= "user://haveTurtle.data"

var skin =-1 setget setSkin
const filepathSkin = "user://Skin.data"

func _ready():
	loadBestScore()
	loadTotalCoins()
	loadSoundOnOff()
	loadChallengeNumber()
	loadAllHaveSkins()
	loadSkin()

func loadBestScore():
	var file = File.new()
	if not file.file_exists(filepath) : return
	file.open(filepath,file.READ)
	bestscore = file.get_var()
	file.close()
func saveBestScore():
	var file = File.new()
	file.open(filepath, file.WRITE)
	file.store_var(bestscore)
	file.close()
func setBestScore(newValue):
	bestscore = newValue
	saveBestScore()

func setTotalCoins(newvalue):
	totalcoins = newvalue
	saveTotalCoins()
func saveTotalCoins():
	var file = File.new()
	file.open(filepath2, file.WRITE)
	file.store_var(totalcoins)
	file.close()
func loadTotalCoins():
	var file = File.new()
	if not file.file_exists(filepath2) : return
	file.open(filepath2,file.READ)
	totalcoins = file.get_var()
	file.close()

func setSoundOnOff(newvalue):
	soundonoff = newvalue
	saveSoundOnOff()
func saveSoundOnOff():
	var file = File.new()
	file.open(filepath3, file.WRITE)
	file.store_var(soundonoff)
	file.close()
func loadSoundOnOff():
	var file = File.new()
	if not file.file_exists(filepath3) : return
	file.open(filepath3,file.READ)
	soundonoff = file.get_var()
	file.close()

func setChallengeNumber(newValue):
	challengeNumber=newValue
	saveChallengeNumber()
func saveChallengeNumber():
	var file = File.new()
	file.open(filepath4, file.WRITE)
	file.store_var(challengeNumber)
	file.close()
func loadChallengeNumber():
	var file = File.new()
	if not file.file_exists(filepath4) : return
	file.open(filepath4,file.READ)
	challengeNumber = file.get_var()
	file.close()

func setChallengesCompleted(newValue):
	challengesCompleted=newValue
	saveChallengesCompleted()
func saveChallengesCompleted():
	var file = File.new()
	file.open(filepath5, file.WRITE)
	file.store_var(challengesCompleted)
	file.close()
func loadChallengesCompleted():
	var file = File.new()
	if not file.file_exists(filepath5) : return
	file.open(filepath5,file.READ)
	challengesCompleted = file.get_var()
	file.close()

func setHaveSmile(newvalue):
	haveSmile = newvalue
	saveHaveSmile()
func saveHaveSmile():
	var file = File.new()
	file.open(filepathSmile, file.WRITE)
	file.store_var(haveSmile)
	file.close()
func loadHaveSmile():
	var file = File.new()
	if not file.file_exists(filepathSmile) : return
	file.open(filepathSmile,file.READ)
	haveSmile = file.get_var()
	file.close()

func setHaveSad(newvalue):
	haveSad = newvalue
	saveHaveSad()
func saveHaveSad():
	var file = File.new()
	file.open(filepathSad, file.WRITE)
	file.store_var(haveSad)
	file.close()
func loadHaveSad():
	var file = File.new()
	if not file.file_exists(filepathSad) : return
	file.open(filepathSad,file.READ)
	haveSad = file.get_var()
	file.close()

func setHaveAstro(newvalue):
	haveAstro = newvalue
	saveHaveAstro()
func saveHaveAstro():
	var file = File.new()
	file.open(filepathAstro, file.WRITE)
	file.store_var(haveAstro)
	file.close()
func loadHaveAstro():
	var file = File.new()
	if not file.file_exists(filepathAstro) : return
	file.open(filepathAstro,file.READ)
	haveAstro = file.get_var()
	file.close()

func setHaveDuck(newvalue):
	haveDuck = newvalue
	saveHaveDuck()
func saveHaveDuck():
	var file = File.new()
	file.open(filepathDuck, file.WRITE)
	file.store_var(haveDuck)
	file.close()
func loadHaveDuck():
	var file = File.new()
	if not file.file_exists(filepathDuck) : return
	file.open(filepathDuck,file.READ)
	haveDuck = file.get_var()
	file.close()

func setHaveEye(newvalue):
	haveEye = newvalue
	saveHaveEye()
func saveHaveEye():
	var file = File.new()
	file.open(filepathEye, file.WRITE)
	file.store_var(haveEye)
	file.close()
func loadHaveEye():
	var file = File.new()
	if not file.file_exists(filepathEye) : return
	file.open(filepathEye,file.READ)
	haveEye = file.get_var()
	file.close()

func setHaveAngry(newvalue):
	haveAngry = newvalue
	saveHaveAngry()
func saveHaveAngry():
	var file = File.new()
	file.open(filepathAngry, file.WRITE)
	file.store_var(haveAngry)
	file.close()
func loadHaveAngry():
	var file = File.new()
	if not file.file_exists(filepathAngry) : return
	file.open(filepathAngry,file.READ)
	haveAngry = file.get_var()
	file.close()

func setHaveFackaf(newvalue):
	haveFackaf = newvalue
	saveHaveFackaf()
func saveHaveFackaf():
	var file = File.new()
	file.open(filepathFackaf, file.WRITE)
	file.store_var(haveFackaf)
	file.close()
func loadHaveFackaf():
	var file = File.new()
	if not file.file_exists(filepathFackaf) : return
	file.open(filepathFackaf,file.READ)
	haveFackaf = file.get_var()
	file.close()

func setHaveSpiral(newvalue):
	haveSpiral = newvalue
	saveHaveSpiral()
func saveHaveSpiral():
	var file = File.new()
	file.open(filepathSpiral, file.WRITE)
	file.store_var(haveSpiral)
	file.close()
func loadHaveSpiral():
	var file = File.new()
	if not file.file_exists(filepathSpiral) : return
	file.open(filepathSpiral,file.READ)
	haveSpiral = file.get_var()
	file.close()

func setHaveSpiralwow(newvalue):
	haveSpiralwow = newvalue
	saveHaveSpiralwow()
func saveHaveSpiralwow():
	var file = File.new()
	file.open(filepathSpiralwow, file.WRITE)
	file.store_var(haveSpiralwow)
	file.close()
func loadHaveSpiralwow():
	var file = File.new()
	if not file.file_exists(filepathSpiralwow) : return
	file.open(filepathSpiralwow,file.READ)
	haveSpiralwow = file.get_var()
	file.close()

func setHaveTeddy(newvalue):
	haveTeddy = newvalue
	saveHaveTeddy()
func saveHaveTeddy():
	var file = File.new()
	file.open(filepathTeddy, file.WRITE)
	file.store_var(haveTeddy)
	file.close()
func loadHaveTeddy():
	var file = File.new()
	if not file.file_exists(filepathTeddy) : return
	file.open(filepathTeddy,file.READ)
	haveTeddy = file.get_var()
	file.close()

func setHaveTurtle(newvalue):
	haveTurtle = newvalue
	saveHaveTurtle()
func saveHaveTurtle():
	var file = File.new()
	file.open(filepathTurtle, file.WRITE)
	file.store_var(haveTurtle)
	file.close()
func loadHaveTurtle():
	var file = File.new()
	if not file.file_exists(filepathTurtle) : return
	file.open(filepathTurtle,file.READ)
	haveTurtle = file.get_var()
	file.close()

func setSkin(newvalue):
	skin = newvalue
	saveSkin()
func saveSkin():
	var file = File.new()
	file.open(filepathSkin, file.WRITE)
	file.store_var(skin)
	file.close()
func loadSkin():
	var file = File.new()
	if not file.file_exists(filepathSkin) : return
	file.open(filepathSkin,file.READ)
	skin = file.get_var()
	file.close()

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		Transition.FadeTo("res://Scenes/Main.tscn")

func loadAllHaveSkins():
	loadHaveSmile()
	loadHaveSad()
	loadHaveAstro()
	loadHaveDuck()
	loadHaveEye()
	loadHaveAngry()
	loadHaveFackaf()
	loadHaveSpiral()
	loadHaveSpiralwow()
	loadHaveTeddy()
	loadHaveTurtle()
