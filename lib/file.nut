/*
	-= Extended file class =-
	Author: Bimbol

	//-------------------------------------------

	USING EXAMPLE:

	//-------------------------------------------
	// Writing string to file
	//-------------------------------------------

	local myfile = io.file("test.txt", "w");
	if (myfile.isOpen)
	{
		myfile.write("Test :)");
		myfile.write("And this is test2\n");
		myfile.write("Gothic 2 Online");
		myfile.close();
	}
	else
		print(myfile.errorMsg)

	//-------------------------------------------
	// Reading string from file
	//-------------------------------------------

	local myfile = io.file("test.txt", "r");
	if (myfile.isOpen)
	{
		print(myfile.read(io_type.ALL));
		myfile.seek(0);

		print("1 Line:");
		print(myfile.read(io_type.LINE));

		print("2 Line:");
		print(myfile.read(io_type.LINE));

		print("3 Line:");
		print(myfile.read(io_type.LINE));

		myfile.close();
	}
	else
		print(myfile.errorMsg);

	//-------------------------------------------
*/

io <- {}

enum io_type
{
	LINE,
	ALL
};

class io.file extends file
{
	constructor(fileName, mode)
	{
		errorMsg = null;

		try
		{
			base.constructor(fileName, mode);
			isOpen = true;
		}
		catch (msg)
		{
			errorMsg = msg;
			isOpen = false;
		}
	}

	function write(text)
	{
		foreach (char in text)
		{
			writen(char, 'b');
		}
	}

	function read(type = io_type.ALL)
	{
		if (type == io_type.LINE)
		{
			local line = "";
			local char;

			while (!eos() && (char = readn('b')))
			{
				if (char != '\n')
					line += char.tochar();
				else
					return line;
			}

			return line.len() == 0 ? null : line;
		}
		else if (type == io_type.ALL)
		{
			local content = "";
			local char;

			while (!eos() && (char = readn('b')))
			{
				content += char.tochar();
			}

			return content.len() == 0 ? null : content;
		}

		return null;
	}

	function close()
	{
		base.close();
		isOpen = false;
	}

	errorMsg = null;
	isOpen = false;
}

function saveLog(file, params)
{
    local myfile = io.file("database/logs/" + file, "a+");
    if (myfile.isOpen)
    {
	    local datas = date().day + "/" + date().month + " " + date().hour + ":" + date().min;
      myfile.write(datas + " || " + params + " \n");
      myfile.close();
    }
    else
			print(myfile.errorMsg)
};
//saveLog("nazwapliku.txt", jakikolwiekinput);
