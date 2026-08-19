extends GridContainer

func replace_icons():
	for child in get_children():
		child.queue_free()
	#get children and replace with interaction cast things
	#pass in array?
