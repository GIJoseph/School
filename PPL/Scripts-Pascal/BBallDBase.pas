program project2;
uses
    sysutils, classes;

type
	Player = record
		name: string;
		university: string;
		age: integer;
		weight: integer;
		height: string;
		jersey: integer;
		phone: string;
		houseNum: integer;
		street: string;
		city: string;
		zip: string;
	end;
	Team = record
		name: string;
		creationYear: integer;
		budget: string;
		playerNum: integer;
		winNum: integer;
		loseNum: integer;
		playerList: array of Player;
	end;
	stringArray = array of string;
const
    fileName = 'TeamInfo.dat';
var
	teamList : array of Team;
	tfIn: Text;
	line: array of string;
	temp: string;
	index: integer;
	i:integer;
	teamIndex: integer;
	testArray: array of string;
	
function SplitText(delimiter: Char; s: string): stringArray;
	var 
		stringIterator,stringArrayIterator:integer;
		result: array of string;
	begin
		stringArrayIterator := 0;
		SetLength(result, stringArrayIterator + 1);
		for stringIterator := 1 to Length(s) do
		begin
			if s[stringIterator] = delimiter then
				begin
					stringArrayIterator := stringArrayIterator + 1;
					SetLength(result, stringArrayIterator + 1);
				end
			else
				begin
					result[stringArrayIterator] := result[stringArrayIterator] + s[stringIterator];
				end;
		end;
		SplitText := result;
	end;
function replaceCharacterInArray(s: stringArray; toReplace,replaceWith: char):stringArray;
	var
		i,k:integer;
		currentWord: string;
	begin
		for i := 0 to Length(s)-1 do
		begin
			currentWord := s[i];
			for k:=0 to Length(currentWord)-1 do
			begin
				
				if currentWord[k] = toReplace then
				begin
					currentWord[k] := replaceWith;
				end;
			end;
			s[i] := currentWord;
		end;
		replaceCharacterInArray := s;
	end;
function teamToStringArray(teamNum: integer):stringArray;
	var
		teamStringArray: array of string;
	begin
		SetLength(teamStringArray, 6);
		teamStringArray[0] := teamList[teamNum].name;
		teamStringArray[1] := IntToStr(teamList[teamNum].creationYear);
		teamStringArray[2] := teamList[teamNum].budget;
		teamStringArray[3] := IntToStr(teamList[teamNum].playerNum);
		teamStringArray[4] := IntToStr(teamList[teamNum].winNum);
		teamStringArray[5] := IntToStr(teamList[teamNum].loseNum);
		teamToStringArray := teamStringArray;
	end;
function playerToStringArray(teamNum, playerNum:integer):stringArray;
	var
		playerStringArray: array of string;
	begin
		SetLength(playerStringArray, 12);
		playerStringArray[0] := teamList[teamNum].playerList[playerNum].name;
		playerStringArray[1] := teamList[teamNum].playerList[playerNum].university;
		playerStringArray[2] := IntToStr(teamList[teamNum].playerList[playerNum].age);
		playerStringArray[3] := IntToStr(teamList[teamNum].playerList[playerNum].weight);
		playerStringArray[4] := teamList[teamNum].playerList[playerNum].height;
		playerStringArray[5] := IntToStr(teamList[teamNum].playerList[playerNum].jersey);
		playerStringArray[6] := teamList[teamNum].playerList[playerNum].phone;
		playerStringArray[7] := IntToStr(teamList[teamNum].playerList[playerNum].houseNum);
		playerStringArray[8] := teamList[teamNum].playerList[playerNum].street;
		playerStringArray[9] := teamList[teamNum].playerList[playerNum].city;
		playerStringArray[10] := teamList[teamNum].playerList[playerNum].zip;
		
		playerToStringArray := playerStringArray;
		
	end;
procedure addPlayer(teamNum: integer; Name:string; University: string; Age:integer; Weight:integer; Height:string; Jersey: integer; Phone:string; HouseNum:integer; Street:string; City: string; Zip:string);
	var tempPlayer: Player;
	begin
		if(Length(teamList[teamNum].playerList) <= 20) then
		begin
			index := Length(teamList[teamNum].playerList);
			teamList[teamNum].playerNum := index + 1;
			SetLength(teamList[teamNum].playerList, index+1);

			tempPlayer.name := Name;
			tempPlayer.university := University;
			tempPlayer.age := Age;
			tempPlayer.weight := Weight;
			tempPlayer.height := Height;
			tempPlayer.jersey := Jersey;
			tempPlayer.phone := Phone;
			tempPlayer.houseNum := HouseNum;
			tempPlayer.street := Street;
			tempPlayer.city := City;
			tempPlayer.zip := Zip;

			teamList[teamNum].playerList[index] := tempPlayer;
		end
		else
		begin
			writeln('Error: Maximum number of players reached for this team');
		end;
	end;
procedure addTeam( Name: string; CreationYear: integer; Budget: string; PlayerNum:integer; WinNum:integer; LoseNum:integer);
	var tempTeam:Team;
	begin
		if (Length(teamList) <= 10) then
		begin
			index := Length(teamList);
			SetLength(teamList, index+1);

			tempTeam.name := Name;
			tempTeam.creationYear := CreationYear;
			tempTeam.budget := Budget;
			tempTeam.playerNum := PlayerNum;
			tempTeam.winNum := WinNum;
			tempTeam.loseNum := LoseNum;

			teamList[index] := tempTeam;
		end
		else
		begin
			writeln('Error: Maximum number of teams has been reached');
		end;
		
	end;

procedure printPlayer(teamNum, playerNum: integer);
	var tempPlayer: Player;
	begin
		index := teamNum;
		tempPlayer := teamList[teamNum].playerList[playerNum];
		writeln('=================================================');
		writeln('Name: ', tempPlayer.name);
		writeln('College: ', tempPlayer.university);
		writeln('Age: ', tempPlayer.age);
		writeln('Weight: ', tempPlayer.weight);
		writeln('Height: ',tempPlayer.height);
		writeln('Jersey Number: ',tempPlayer.jersey);
		writeln('Phone Number:',tempPlayer.phone);
		writeln('Address: ',tempPlayer.houseNum,' ',tempPlayer.street,' ',tempPlayer.city, ' ', tempPlayer.zip);
	end;
procedure printTeam(teamNum: integer);
	var j:integer;
	begin
		index := teamNum;
		writeln('Team Name: ',teamList[index].name);
		writeln('Year Created: ',teamList[index].creationYear);
		writeln('Budget: ',teamList[index].budget);
		writeln('Number of Players: ',teamList[index].playerNum);
		writeln('Wins: ',teamList[index].winNum);
		writeln('Losses: ',teamList[index].loseNum);
		if teamList[index].playerNum > 0 then
		begin
			for j := 0 to teamList[index].playerNum - 1 do
			begin
				writeln(j,') View ',teamList[index].playerList[j].name);
			end;
		end;
			writeln(teamList[index].playerNum,') Add Player');
			writeln(teamList[index].playerNum+1,') Edit Budget');
			writeln(teamList[index].playerNum+2,') Edit Win/Lose');
			writeln(teamList[index].playerNum+3,') Go Back');
	end;
procedure editPlayer(teamNum,playerNum:integer);//The menu for editing the player
	var l:integer;
	begin
		writeln('What would you like to change about ', teamList[teamNum].playerList[playerNum].name,'?');
		writeln('0) Name');
		writeln('1) College');
		writeln('2) Age');
		writeln('3) Weight');
		writeln('4) Height');
		writeln('5) Jersey Number');
		writeln('6) Phone Number');
		writeln('7) Address');
		readln(l);
		case (l) of
			0: readln(teamList[teamNum].playerList[playerNum].name);
			1: readln(teamList[teamNum].playerList[playerNum].university);
			2: readln(teamList[teamNum].playerList[playerNum].age);
			3: readln(teamList[teamNum].playerList[playerNum].weight);
			4: readln(teamList[teamNum].playerList[playerNum].height);
			5: readln(teamList[teamNum].playerList[playerNum].jersey);
			6: readln(teamList[teamNum].playerList[playerNum].phone);
			7: 	begin
					writeln('Enter house number');
					readln(teamList[teamNum].playerList[playerNum].houseNum);
					writeln('Enter street');
					readln(teamList[teamNum].playerList[playerNum].street);
					writeln('Enter city');
					readln(teamList[teamNum].playerList[playerNum].city);
					writeln('Enter zip code');
					readln(teamList[teamNum].playerList[playerNum].zip);
				end;
		end;
	end;
procedure addPlayerQuestions(teamNum:integer);
	var
		name, college, phone, street, city, zip, height:string;
		age, weight, jersey, houseNum:integer;
	begin
		writeln('What is the persons name?');
		readln(name);
		writeln('What college did they go to?');
		readln(college);
		writeln('How old are they?');
		readln(age);
		writeln('How much do they weight?');
		readln(weight);
		writeln('What is their height?');
		readln(height);
		writeln('What is their jersey number?');
		readln(jersey);
		writeln('What is their phone number?');
		readln(phone);
		writeln('What is their house number?');
		readln(houseNum);
		writeln('What is their street name?');
		readln(street);
		writeln('What city do they live in?');
		readln(city);
		writeln('What is that citys zip code?');
		readln(zip);
		addPlayer(teamNum,name,college,age,weight,height,jersey,phone,houseNum,street,city,zip);
		
	end;
procedure deletePlayer(teamNum,playerNum:integer);
	var l:integer;
	begin
		for l := playerNum to teamList[teamNum].playerNum - 2 do
		begin
			teamList[teamNum].playerList[l] := teamList[teamNum].playerList[l+1];
		end;
		SetLength(teamList[teamNum].playerList, Length(teamList[teamNum].playerList)-1);
		teamList[teamNum].playerNum := teamList[teamNum].playerNum-1
	end;
procedure changeBudget(teamNum:integer);
	var budget:string;
	begin
		writeln('What is the new budget?');
		readln(budget);
		teamList[teamNum].budget := budget;
	end;
procedure changeWinLose(teamNum:integer);
	var option,number:integer;
	begin
		writeln('Which would you like to change?');
		writeln('0) Number of Wins');
		writeln('1) Number of Loses');
		writeln('2) Go Back');
		readln(option);
		if(option = 1) then
		begin
			writeln('What is the new win number?');
			readln(number);
			teamList[teamNum].winNum := number;
		end;
		if(option = 2) then
		begin
			writeln('What is the new lose number?');
			readln(number);
			teamList[teamNum].loseNum := number;
		end;
	end;
procedure menuTeams();
var
	k,j,h,playerNum:integer;
	year,winNum,loseNum:integer;
	TName,budget:string;
	begin
		k := 0;
		j := 0;
		h := 0;
		repeat
			writeln('=================================================');
			writeln('Which team do you want to view?');
			for i:=0 to Length(teamList) - 1 do
			begin
				writeln(i,') ',teamList[i].name);
			end;
			writeln(Length(teamList),') Add a Team');
			writeln(Length(teamList)+1,') Go Back');
			readln(k);
			
			if(k < Length(teamList)) then
			begin
				writeln('=================================================');
				writeln('What would you like to do?');
				printTeam(k);
				readln(j);
				playerNum := Length(teamList[k].playerList);//this is needed so if we delete the last player in list it doesn't automatically goto add player option
				if (j < playerNum) then// choose view player option
				begin
					printPlayer(k,j);
					writeln('0) Edit Player');
					writeln('1) Delete Player');
					writeln('2) Go Back');
					readln(h);
					if(h = 0)then//choose edit player
					begin
						editPlayer(k,j);
					end;
					if(h = 1)then // choose delete player
					begin
						deletePlayer(k,j);
					end
				end;
				if (j = playerNum) then//choose add Player option
				begin
					addPlayerQuestions(k);
				end;
				if (j = playerNum+1) then//choose change budget option
				begin
					changeBudget(k);
				end;
				if (j = playerNum+2) then// choose change win lose option
				begin
					changeWinLose(k);
				end;
			end;
			if k = Length(teamList) then
			begin
				writeln('What is the name of the team?');
				readln(TName);
				writeln('What year was it created?');
				readln(year);
				writeln('What is the their budget?');
				readln(budget);
				writeln('How many wins does the team have?');
				readln(winNum);
				writeln('How many loses?');
				readln(loseNum);
				addTeam(TName,year,budget,0,winNum,loseNum);
			end;
			
			
		until k = Length(teamList)+1;
	end;
procedure saveData();
	var 
		tfOut:Text;
		a,b:integer;
		currentTeam: Team;
		currentPlayer: Player;
	begin
		Assign(tfOut, fileName);
		rewrite(tfOut);
		for a := 0 to Length(teamList)-1 do
		begin
			line := teamToStringArray(a);
			line := replaceCharacterInArray(line, #32,#95);
			writeln(tfOut,line[0],#32,line[1],#32,line[2],#32,line[3],#32,line[4],#32,line[5]);
			if (Length(teamList[a].playerList) > 0) then
			begin
				for b := 0 to Length(teamList[a].playerList)-1 do
				begin
					line := playerToStringArray(a,b);
					writeln(tfOut,line[0],#32,line[1],#32,line[2],#32,line[3],#32,line[4],#32,line[5],#32,line[6],#32,line[7],#32,line[8],#32,line[9],#32,line[10]);
				end;
			end;
		end;
		Close(tfOut);
	end;
procedure menuMain();
	var 
		i:integer;
		
	begin
		i := 0;
		repeat
			writeln('=================================================');
			writeln('What would you like to do? (Enter number to do task)');
			writeln('0) View Teams');
			writeln('1) Save');
			writeln('2) Save and Quit');
			Readln(i);
			case (i) of
				0:	menuTeams();
				1,2: saveData();
			end;//end case
		until i = 2;
	end;
begin

	teamIndex := 0;
	writeln('Reading contents of ', fileName);
	Assign(tfIn, fileName);
	
	reset(tfIn);
	while not eof(tfIn) do
	begin
		teamIndex := teamIndex + 1;
		readln(tfIn, temp);//reads the team line
		
		line := SplitText(#32,temp);//#9 because that is value for \t
		line := replaceCharacterInArray(line, #95, #32);
		
		addTeam(line[0],StrToInt(line[1]),line[2],StrToInt(line[3]),StrToInt(line[4]),StrToInt(line[5]));
		if (teamList[teamIndex-1].playerNum > 0)then
		begin
			for i:=0 to teamList[teamIndex-1].playerNum-1 do
			begin
				readln(tfIn, temp);//reads the Player like for the team
				line := SplitText(#32,temp);//#32 because that is value for SPACE
				//assigns the resulting array into line
				
				addPlayer(teamIndex-1 ,line[0],line[1],StrToInt(line[2]),StrToInt(line[3]),line[4],StrToInt(line[5]),line[6],StrToInt(line[7]),line[8],line[9],line[10]);
				
			end;
		end;
	end;
	Close(tfIn);
	menuMain();
	
end.
