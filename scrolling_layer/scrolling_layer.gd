extends ParallaxLayer

@onready var sprite_2d = $Sprite2D

@export var texture: Texture
@export var scroll_sacle: float = 0.0
@export var txt_x: float = 1920
@export var txt_y: float = 1020


# Called when the node enters the scene tree for the first time.
func _ready():
	motion_scale.x = scroll_sacle
	
	var scale_f = get_viewport_rect().size.y / txt_y
	
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_f,scale_f)
	motion_mirroring.x = txt_x*scale_f
