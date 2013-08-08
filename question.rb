boom = Array.new(15)
boom.length.times do |i|
        boom[i]= Array.new(30,false)
        6.times do |j|
  boom[i][j]=true
        end
        if(i < 10) then
	boom[i][6]=true
        end
        boom[i].shuffle!
end
10.times do
        7.times do |i|
                temp=boom[i][0..14]
                boom[i][0..14]=boom[i+7][15..29]
                boom[i+7][15..29]=temp[0..14]
		boom[i].shuffle!
		boom[i+7].shuffle!
        end
end

#neignbour boom count
near = Array.new(15)
near.length.times do |i|
        near[i]= Array.new(30)
end
boom.length.times do |row|
        boom[row].length.times do |column|
	if(boom[row][column] == false) then
	        count=0
	        startX=row-1
	        startY=column-1
	        startX.upto(startX+2) do |i|
	                startY.upto(startY+2) do |j|
		        if( ( i>=0 && j>=0 ) && ( i<15 && j<30 ) ) then
			if(boom[i][j] == true) then
			        count+=1
			end
		        end
	                end
	        end
	        near[row][column]=count
	else
	end
        end
end
