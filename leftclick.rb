require "question.rb"

#Left Click
def leftClick(i,j)
	if button[i][j].background != FLAG
		if !firstclick
			openBox(i,j)
		else
			firstclick=false
			firstClickCall()
		end
	end
end

def openBox(i,j)
	if boom[i][j] == false			#not boom, have a number
		openTheBox(i,j)
	elsif boom[i][j] == nil			#not boom, not have a number
		openTheSurroundingBox(i,j)
	else							#have boom
		blastTheBombs()
	end
end

def openTheBox(i,j)
	button[i][j].visible = false
end

def openTheSurroundingBox(i,j)
	for(tempX = 0; tempX < 3; tempX++)
		for(tempY = 0; tempY < 3; tempY++)
			openTheBox(tempX,tempY)
			if !((tempX == 1) && (tempY == 1))
				if boom[tempX][tempY] == nil
					openTheSurroundingBox(tempX,tempY)   #recursive call to open the surrounging boxes
				end
			end
		end
	end
end

def firstClickCall(i,j)
	if boom[i][j] == true
		tempX = getRandomNumber() % 15;
		tempY = getRandomNumber() % 30;
		if !((tempX == i) && (tempY == j))
			openBox(i,j)
		else
			firstClickCall(i,j)   #recursive call
		end
	end
end

def blastTheBombs
	for(tempX = 0; tempX < 15; tempX++)
		for(tempY = 0; tempY < 30; tempY++)
			if ((boom[tempX][tempY] == true) && (button[tempX][tempY] != FLAG))
				button[tempX][tempY].background = BOMBPIC		#
			end
		end
	end
end
