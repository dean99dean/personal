scriptId = "Hackathon"
appTitle = ""
Zstart=0
Zmeasure=0
deltaZ=0
Ystart = 0
Ymeasure=0
deltaY = 0
status=1
x=0
y=0
z=0

function onForegroundWindowChange(app, title)
	if (app == "chrome.exe") then
		appTitle = title
		Ystart = myo.getPitch()
		Zstart = myo.getYaw()
	    myo.unlock("hold")
        myo.notifyUserAction()
	end 
	return true
end

function leftDrum()
	myo.keyboard("f","press")
end

function rightDrum()
	myo.keyboard("j","press")
end

function start()
	myo.vibrate("short")
end

function onPeriodic()
	local Ymeasure = myo.getPitch()
	local Zmeasure = myo.getYaw()
	local x, y, z = myo.getGyro()
	if ((y<0.2)and(y>-0.2)) then
		y=0
	end
	deltaY = Ymeasure - Ystart
	deltaZ = Zmeasure - Zstart
	if (status== 1) then
		
			if deltaY <- 0.1 and deltaZ<-0.02 then
				leftDrum()   

				status= -1
			end
	
			if deltaY <-0.1 and deltaZ>0.02 then
				rightDrum()
				status = -1
			end

		
		
		
	elseif(status== -1) then	
	
		if deltaY >0.05 then
			status = 1
		end
		
	end	
end

function onPoseEdge(pose,edge)



	if edge =="on" then
		if pose=="waveIn"  then
			myo.keyboard("return","press")
			Ystart = myo.getPitch()
			Zstart = myo.getYaw()
		end
	end
	if edge == "off" then
        myo.unlock("hold")

        myo.notifyUserAction()
    end
end



