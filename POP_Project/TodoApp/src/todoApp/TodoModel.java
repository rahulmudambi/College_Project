package todoApp;

import java.io.File;
import java.io.IOException;

public class TodoModel {
	
	public boolean checkIfCategoryExists(String s)
	{
	try
	{
		String path = "/home/student/229/College_Project/POP_Project/TodoApp/src/todoApp/" + s;
		File f = new File(path);
		if(f.exists())
			return false;
		else {f.createNewFile();return true;}
	}
	
	catch(IOException ioe)
	{
		ioe.printStackTrace();
		return false;
	}
	
	}

}
