extends PathFollow3D


var speed = 0.05  # Adjust speed as needed

func _process(delta):
	self.progress_ratio += speed * delta
	if self.progress_ratio > 1.0:
		self.progress_ratio = 0.0  # Loop back to the start of the path
	self.look_at(self.position + self.transform.basis.z, Vector3.UP)
