extends Sprite2D

# A variável do ColorRect
@onready var bg = $BG

# Cores associadas ao score
var cores = [
	Color("FF00FF"),   
	Color("FF0000"),   
	Color("FFFF00"),    
]
# Score dos jogadores [0: Player, 1: CPU]
var score := [0, 0]

# Constante de velocidade do paddle
const PADDLE_SPEED : int = 500

func _on_ball_timer_timeout():
	$Ball.new_ball()

func _on_score_left_body_entered(body):
	score[1] += 1
	$Hud/CPUScore.text = str(score[1])
	$BallTimer.start()
	updateBackgroundColor()

func _on_score_right_body_entered(body):
	score[0] += 1
	$Hud/PlayerScore.text = str(score[0])
	$BallTimer.start()
	updateBackgroundColor()

# Função para atualizar a cor do background com base no score
func updateBackgroundColor():
	# Determinar a cor com base na soma dos scores dos jogadores
	var soma_scores = score[0] + score[1]
	var indice_cor = soma_scores % cores.size()
	bg.color = cores[indice_cor]

