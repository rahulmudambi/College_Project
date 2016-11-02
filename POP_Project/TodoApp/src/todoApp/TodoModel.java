package todoApp;

import java.io.*;
//import java.io.IOException;

public class TodoModel {
	
	public boolean checkIfCategoryExists(String s,int n)
	{
	try
	{
		String path = "C:/Users/Rahul/Desktop/College_project/POP_Project/TodoApp/src/todoApp/" + s;
		File f = new File(path);
		if(f.exists())
			return false;
		else if(n==1){f.createNewFile();return true;}
		else return true;
	}
	
	catch(IOException ioe)
	{
		ioe.printStackTrace();
		return false;
	}
	
	}
	
	public  String addTask(TaskBean name,String catName)
	{
		try
		{
		String path = "C:/Users/Rahul/Desktop/College_project/POP_Project/TodoApp/src/todoApp/" + catName;
		FileOutputStream fileOut = new FileOutputStream(path);
		ObjectOutputStream out = new ObjectOutputStream(fileOut);
		out.writeObject(name);
		out.close();
		fileOut.close();
		FileInputStream fileIn = new FileInputStream(path);
		ObjectInputStream in = new ObjectInputStream(fileIn);
		TaskBean tb = (TaskBean)(in.readObject());
		System.out.println("Name = "+tb.getName());
		System.out.println("desc: "+tb.getDesc());
		in.close();
		return null;
		}
		catch(IOException ioe)
		{
			ioe.printStackTrace();
		}
		catch(ClassNotFoundException c)
		{
			System.out.println("NO class found...");
			
		}
		
		return null;
		
	}

}