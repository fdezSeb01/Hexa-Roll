extends ScrollContainer #31d8ff

var ScreenPressed=false
var PressedIndex=0
signal succesfulChoice

enum {SMILEY,SAD,ASTRO,DUCK,EYE,ANGRY,FACKAF,SPIRAL,SPIRALWOW,TEDDY,TURTLE}

export(float,0.5,1,0.1) var ItemScale=1
export(float,1,1.5,0.1) var ItemCurrentScale=1.5
export(float,0.1,1,0.1) var ScrollDuration = 0.6

var ItemCurrentIndex: int =0
var ItemSelected: int=0
var ItemYPositions: Array=[]

onready var scroll_tween: Tween = Tween.new()
onready var MarginBottom: int = $CenterContainer/MarginContainer.get("custom_constants/margin_bottom")
onready var ItemSpace: int= $CenterContainer/MarginContainer/VBoxContainer.get("custom_constants/separation")
onready var ItemNodes: Array= $CenterContainer/MarginContainer/VBoxContainer.get_children()


func _ready():
	add_child(scroll_tween)
	yield(get_tree(), "idle_frame")
	
	get_v_scrollbar().modulate.a=0
	
	for Item in ItemNodes:
		var ItemPosY: float = (MarginBottom+Item.rect_position.y)-((rect_size.y - Item.rect_size.y)/2)
		Item.rect_pivot_offset=(Item.rect_size)/2
		ItemYPositions.append(ItemPosY)
	scroll_vertical=ItemYPositions[ItemCurrentIndex]
	if(GameData.skin>=0):
		ItemNodes[GameData.skin].get_node("Label2").visible=true
	scroll()

func _process(delta):
	for index in range(ItemYPositions.size()):
		var ItemPosY: float = ItemYPositions[index]
		var SwipeLength: float = (ItemNodes[index].rect_size.x/2)+(ItemSpace/2)
		var SwipeCurrentLength: float = abs(ItemPosY -scroll_vertical)
		var _itemScale: float = range_lerp(SwipeCurrentLength,SwipeLength,0,ItemScale,ItemCurrentScale)
		var _itemOpacity: float = range_lerp(SwipeCurrentLength,SwipeLength,0,0.6,1)
		var _labelOpacity: float = range_lerp(SwipeCurrentLength,SwipeLength,0,0,1)
		
		_itemScale= clamp(_itemScale,ItemScale,ItemCurrentScale)
		_itemOpacity=clamp(_itemOpacity,0.6,1)
		_labelOpacity=clamp(_labelOpacity,0,1)
		
		ItemNodes[index].rect_scale=Vector2(_itemScale,_itemScale)
		
		if skinAvailable(index):
			ItemNodes[index].get_node("TextureRect").modulate.a=_itemOpacity
			ItemNodes[index].get_node("Label").modulate.a=0
			ItemNodes[index].get_node("Label2").modulate.a=_labelOpacity
		else:
			ItemNodes[index].get_node("TextureRect").modulate.a=0.3
			ItemNodes[index].get_node("Label").modulate.a=_labelOpacity
			ItemNodes[index].get_node("Label2").modulate.a=0
		
		if SwipeCurrentLength<SwipeLength:
			ItemCurrentIndex=index

func scroll():
	scroll_tween.interpolate_property(
		self,
		'scroll_vertical',
		scroll_vertical,
		ItemYPositions[ItemCurrentIndex],
		ScrollDuration,
		Tween.TRANS_BACK,
		Tween.EASE_OUT)
	
	for index in range(ItemNodes.size()):
		var _itemScale: float = ItemCurrentScale if index==ItemCurrentIndex else ItemScale
		scroll_tween.interpolate_property(
			ItemNodes[index],
			'rect_scale',
			ItemNodes[index].rect_scale,
			Vector2(_itemScale,_itemScale),
			ScrollDuration,
			Tween.TRANS_BACK,
			Tween.EASE_OUT)
	
	scroll_tween.start()


func _on_ScrollableChoices_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			scroll_tween.stop_all()
		else:
			scroll()

func _input(event):
	var topleft: Vector2 = Vector2(750/2-((160*1.5)/2),1548/2-((160*1.5)/2))
	var botright: Vector2=Vector2(topleft.x+(160*1.5),topleft.y+(160*1.5))
	var isInArea: bool = get_global_mouse_position().x >= topleft.x and get_global_mouse_position().x<=botright.x and get_global_mouse_position().y >= topleft.y and get_global_mouse_position().y<=botright.y
	if isInArea and !ScreenPressed and event is InputEventScreenTouch and event.pressed:
		ScreenPressed=true
		PressedIndex=event.index
	if  ScreenPressed and event is InputEventScreenTouch and !event.pressed and (event.index==PressedIndex):
		ScreenPressed=false
		if isInArea:
			emit_signal("succesfulChoice")

func skinAvailable(index):
	match index:
		SMILEY:
			return GameData.haveSmile
		SAD:
			return GameData.haveSad
		ASTRO:
			return GameData.haveAstro
		DUCK:
			return GameData.haveDuck
		EYE:
			return GameData.haveEye
		ANGRY:
			return GameData.haveAngry
		FACKAF:
			return GameData.haveFackaf
		SPIRAL:
			return GameData.haveSpiral
		SPIRALWOW:
			return GameData.haveSpiralwow
		TEDDY:
			return GameData.haveTeddy
		TURTLE:
			return GameData.haveTurtle


func _on_StoreNew_purchase():
	GameData.loadAllHaveSkins()
